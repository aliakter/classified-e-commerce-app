import 'dart:async';
import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/views/price_planing/model/price_planing_model.dart';
import 'package:classified_apps/apps/views/price_planing/repository/price_planing_repository.dart';
import 'package:classified_apps/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_auth/http_auth.dart';

class PricePlaningController extends GetxController {
  final PricePlaningRepository repository;

  PricePlaningController(this.repository);

  RxBool isLoading = false.obs;
  Map<String, dynamic>? paymentIntent;
  String token = "";
  String userId = "";
  String userFullName = "";
  String userEmail = "";
  String userPhone = "";

  @override
  void onInit() {
    super.onInit();
    getToken();
    getPlanData();
  }

  getToken() {
    token = sharedPreferences.getString("userToken") ?? "";
    userId = sharedPreferences.getString("userId") ?? "";
    userFullName = sharedPreferences.getString("userFullName") ?? "";
    userEmail = sharedPreferences.getString("userEmail") ?? "";
    userPhone = sharedPreferences.getString("userPhone") ?? "";
  }

  PricePlaningModel? planingModel;

  void getPlanData() async {
    isLoading.value = true;
    final result = await repository.getPlanData(token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      planingModel = data;
      isLoading.value = false;
    });
  }

  Future<void> stripeMakePayment(String price, int planID) async {
    try {
      paymentIntent = await createPaymentIntent(price, 'USD');
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              billingDetails: BillingDetails(
                name: userFullName,
                email: userEmail,
                phone: userPhone,
                // address: Address(
                //     city: 'YOUR CITY',
                //     country: 'YOUR COUNTRY',
                //     line1: 'YOUR ADDRESS 1',
                //     line2: 'YOUR ADDRESS 2',
                //     postalCode: 'YOUR PINCODE',
                //     state: 'YOUR STATE'),
              ),
              paymentIntentClientSecret:
                  paymentIntent!['client_secret'], //Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: userFullName,
            ),
          )
          .then((value) {});

      displayPaymentSheet(paymentIntent!['id'], planID);
    } catch (e) {
      print(e.toString());
    }
  }

  displayPaymentSheet(String paymentIntentID, int planID) async {
    try {
      await Stripe.instance.presentPaymentSheet();

      ///get transaction id
      retrieveTxnId(paymentIntentID).then((value) {
        planPayment(planID, value!, "Stripe");
      });

      Get.snackbar('Payment success', 'Payment successfully completed');
    } on Exception catch (e) {
      if (e is StripeException) {
        Get.snackbar("Error from Stripe", "${e.error.localizedMessage}");
      } else {
        print(e.toString());
      }
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      log(response.body);
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }

  Future<String?> retrieveTxnId(String paymentIntent) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              'https://api.stripe.com/v1/charges?payment_intent=$paymentIntent'),
          headers: {
            "Authorization": "Bearer ${dotenv.env['STRIPE_SECRET']}",
            "Content-Type": "application/x-www-form-urlencoded"
          });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        log("Transaction Id ${data['data'][0]['balance_transaction']}");
        return data['data'][0]['balance_transaction'];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> planPayment(
      int planID, String transactionID, String paymentProvider) async {
    try {
      Map<String, dynamic> body = {
        "plan_id": planID.toString(),
        "status": "success",
        "order": transactionID,
        "payment_provider": paymentProvider
      };

      final url = Uri.parse("${RemoteUrls.baseUrl}payment-store");

      final headers = {
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      };

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        log(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///=======================================>>>> paypal

  String domain = "https://api.sandbox.paypal.com"; // for sandbox mode
//  String domain = "https://api.paypal.com"; // for production mode

  String clientId =
      'Aa8_7OJaxmCZQpkx3hbzdySDz7haM0Wu6c6MmzX5JQsaywY1i8HMJo2ddnr9-pEEoRP3qvjflrxOVoXL';
  String secret =
      'ELMx8Z_ddA0Z597lD-dDPssM4VxBbnWvvoxb1mjuIiMCHLRSzbSN6owESivW4moqRPPYOTyl1J9QxSx0';

  // for getting the access token from Paypal
  Future<String?> getAccessToken() async {
    try {
      var client = BasicAuthClient(clientId, secret);
      var response = await client.post(
          Uri.parse('$domain/v1/oauth2/token?grant_type=client_credentials'));
      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body);
        return body["access_token"];
      }
    } catch (e) {
      rethrow;
    }
  }

  // for creating the payment request with Paypal
  Future<Map<String, String>?> createPaypalPayment(
      transactions, accessToken) async {
    try {
      var response = await http.post(Uri.parse("$domain/v1/payments/payment"),
          body: convert.jsonEncode(transactions),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer $accessToken'
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (body["links"] != null && body["links"].length > 0) {
          List links = body["links"];

          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "approval_url",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }
          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"];
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }
      } else {
        throw Exception(body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  // for executing the payment transaction
  Future<String?> executePayment(url, payerId, accessToken) async {
    try {
      var response = await http.post(Uri.parse(url),
          body: convert.jsonEncode({"payer_id": payerId}),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer $accessToken'
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        return body["id"];
      }
    } catch (e) {
      rethrow;
    }
  }
}

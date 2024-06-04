import 'dart:core';
import 'dart:developer';
import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controller/price_planing_controller.dart';

class PaypalPayment extends StatefulWidget {
  const PaypalPayment({super.key, required this.planID, required this.price});

  final String price;
  final int planID;

  @override
  State<StatefulWidget> createState() {
    return PaypalPaymentState();
  }
}

class PaypalPaymentState extends State<PaypalPayment> {
  String checkoutUrl = "";
  String executeUrl = "";
  String accessToken = "";

  late WebViewController webViewController;

  // you can change default currency according to your need
  Map<dynamic, dynamic> defaultCurrency = {
    "symbol": "USD ",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "USD"
  };

  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL = 'cancel.example.com';

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      try {
        accessToken =
            (await Get.find<PricePlaningController>().getAccessToken())!;

        final transactions = getOrderParams();
        final res = await Get.find<PricePlaningController>()
            .createPaypalPayment(transactions, accessToken);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"]!;
            executeUrl = res["executeUrl"]!;
          });
        }
      } catch (e) {
        log("------------->>>" + e.toString());
      }
    }).then((value) {
      webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.contains(returnURL)) {
                final uri = Uri.parse(request.url);
                final payerID = uri.queryParameters['PayerID'];
                if (payerID != null) {
                  Get.find<PricePlaningController>()
                      .executePayment(executeUrl, payerID, accessToken)
                      .then((id) {
                    Get.find<PricePlaningController>()
                        .planPayment(widget.planID, id ?? "", "Paypal");
                    log('===================>>> $id');
                    Get.snackbar(
                        'Payment success', 'Payment successfully completed');
                    Navigator.of(context).pop();
                  });
                } else {
                  Navigator.of(context).pop();
                }
                Navigator.of(context).pop();
              }
              if (request.url.contains(cancelURL)) {
                Navigator.of(context).pop();
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(
          Uri.parse(checkoutUrl),
        );
    });
  }

  // item name, price and quantity
  String itemName = 'Plan';
  int quantity = 1;

  Map<String, dynamic> getOrderParams() {
    List items = [
      {
        "name": itemName,
        "quantity": quantity,
        "price": widget.price,
        "currency": defaultCurrency["currency"]
      }
    ];

    // checkout invoice details
    String shippingCost = '0';
    int shippingDiscountCost = 0;
    // String userFirstName = 'Gulshan';
    // String userLastName = 'Yadav';
    // String addressCity = 'Delhi';
    // String addressStreet = 'Mathura Road';
    // String addressZipCode = '110014';
    // String addressCountry = 'India';
    // String addressState = 'Delhi';
    // String addressPhoneNumber = '+919990119091';

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": widget.price,
            "currency": defaultCurrency["currency"],
            "details": {
              "subtotal": widget.price,
              "shipping": shippingCost,
              "shipping_discount": ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
            // if (isEnableShipping && isEnableAddress)
            //   "shipping_address": {
            //     "recipient_name": userFirstName + " " + userLastName,
            //     "line1": addressStreet,
            //     "line2": "",
            //     "city": addressCity,
            //     "country_code": addressCountry,
            //     "postal_code": addressZipCode,
            //     "phone": addressPhoneNumber,
            //     "state": addressState
            //   },
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    log(checkoutUrl);

    if (checkoutUrl.isNotEmpty) {
      log("---------------->>> find the checkout url");
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: WebViewWidget(
          controller: webViewController,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: redColor,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
          elevation: 0.0,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
  }
}

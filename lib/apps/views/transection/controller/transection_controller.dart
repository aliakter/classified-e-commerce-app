import 'package:classified_apps/apps/views/public_profile/repository/public_profile_repository.dart';
import 'package:classified_apps/apps/views/transection/model/transaction_model.dart';
import 'package:classified_apps/main.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final PublicProfileRepository publicProfileRepository;
  TransactionController(this.publicProfileRepository);

  String token = "";
  String userId = "";

  @override
  void onInit() {
    super.onInit();
    getToken();
    getTransaction();
  }

  getToken() {
    token = sharedPreferences.getString("userToken") ?? "";
    userId = sharedPreferences.getString("userId") ?? "";
  }

  String capitalize(String input) {
    if (input == null || input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  RxBool isLoading = false.obs;
  List<TransactionModel>? transactionModel;

  void getTransaction() async {
    isLoading(true);
    final result = await publicProfileRepository.getTransaction(token);
    result.fold((error) {
      isLoading(false);
      print(error.message);
    }, (data) async {
      transactionModel = data;
      isLoading(false);
    });
  }
}

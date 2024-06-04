import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/apps/views/user_plan/model/user_plan_model.dart';
import 'package:classified_apps/apps/views/user_plan/repository/user_plan_repository.dart';
import 'package:classified_apps/main.dart';
import 'package:get/get.dart';

class UserPlanController extends GetxController {
  final UserPlanRepository repository;
  final LoginController loginController;
  RxBool isLoading = false.obs;

  UserPlanController(this.loginController, this.repository);

  String token = "";
  String userId = "";
  @override
  void onInit() {
    getToken();
    getPlanData();
    super.onInit();
  }
  getToken(){
    token = sharedPreferences.getString("userToken")??"";
    userId = sharedPreferences.getString("userId")??"";
  }
  UserPlanModel? planModel;

  Future<void> getPlanData() async {
    isLoading.value = true;
    final result =
        await repository.getUserPlan(token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      planModel = data;
      isLoading.value = false;
    });
  }
}

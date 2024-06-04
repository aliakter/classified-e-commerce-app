import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/apps/views/dashboard/model/dashboard_model.dart';
import 'package:classified_apps/main.dart';
import 'package:get/get.dart';
import '../repository/dashboard_repository.dart';

class DashboardController extends GetxController {
  final LoginController loginController;
  final DashboardRepository dashboardRepository;

  DashboardController(this.loginController, this.dashboardRepository);

  RxBool isLoading = false.obs;
  String token = "";
  String userId = "";
  DashboardModel? dashboardModel;

  @override
  void onInit() {
    getToken();
    getDashboardData();
    super.onInit();
  }

  getToken(){
    token = sharedPreferences.getString("userToken")??"";
    userId = sharedPreferences.getString("userId")??"";
  }

  getDashboardData() async {
    isLoading.value = true;
    final result = await dashboardRepository
        .getDashboardData(token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      dashboardModel = data;
      isLoading.value = false;
    });
  }
}

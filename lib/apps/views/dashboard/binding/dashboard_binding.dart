import 'package:classified_apps/apps/views/dashboard/controller/dashboard_controller.dart';
import 'package:classified_apps/apps/views/dashboard/repository/dashboard_repository.dart';
import 'package:get/get.dart';
import '../../home/controller/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardRepository>(() => DashboardRepositoryImpl(Get.find()));
    Get.lazyPut(() => DashboardController(Get.find(), Get.find()));
    Get.lazyPut(() => HomeController(Get.find(), Get.find(), Get.find()));
  }
}

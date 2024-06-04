import 'package:classified_apps/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:classified_apps/apps/views/profile_update/repository/profile_update_repository.dart';
import 'package:get/get.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../../dashboard/repository/dashboard_repository.dart';

class ProfileUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUpdateRepository>(
        () => ProfileUpdateRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => ProfileUpdateController(Get.find(), Get.find()));
    Get.lazyPut<DashboardRepository>(() => DashboardRepositoryImpl(Get.find()));
    Get.lazyPut(() => DashboardController(Get.find(), Get.find()));
  }
}

import 'package:classified_apps/apps/views/public_profile/controller/public_profile_controller.dart';
import 'package:classified_apps/apps/views/public_profile/repository/public_profile_repository.dart';
import 'package:get/get.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../../profile_update/controller/profile_update_controller.dart';
import '../../profile_update/repository/profile_update_repository.dart';
import '../../dashboard/repository/dashboard_repository.dart';

class PublicProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PublicProfileRepository>(() => PublicProfileRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => PublicProfileController(Get.find(), Get.find(), Get.find()));

    Get.lazyPut<DashboardRepository>(() => DashboardRepositoryImpl(Get.find()));
    Get.lazyPut(() => DashboardController(Get.find(), Get.find()));
    Get.lazyPut<ProfileUpdateRepository>(
            () => ProfileUpdateRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => ProfileUpdateController(Get.find(), Get.find()));
  }
}
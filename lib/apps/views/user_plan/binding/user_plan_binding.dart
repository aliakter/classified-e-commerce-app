import 'package:classified_apps/apps/views/user_plan/controller/user_plan_controller.dart';
import 'package:classified_apps/apps/views/user_plan/repository/user_plan_repository.dart';
import 'package:get/get.dart';

class UserPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserPlanRepository>(
        () => UserPlanRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => UserPlanController(Get.find(), Get.find()));
  }
}

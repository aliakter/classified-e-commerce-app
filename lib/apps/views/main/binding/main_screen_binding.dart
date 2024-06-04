import 'package:classified_apps/apps/views/compare/controller/compare_controller.dart';
import 'package:classified_apps/apps/views/home/controller/home_controller.dart';
import 'package:classified_apps/apps/views/home/repository/home_repository.dart';
import 'package:classified_apps/apps/views/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';
import '../../compare/repository/compare_repository.dart';
import '../controller/main_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: Get.find(), localDataSource: Get.find()));
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController(Get.find(), Get.find(), Get.find()));

    Get.lazyPut<CompareRepository>(() => CompareRepositoryImpl(Get.find()));
    Get.lazyPut(() => CompareController(Get.find()));
    Get.lazyPut(() => ProfileController(Get.find()));
  }
}

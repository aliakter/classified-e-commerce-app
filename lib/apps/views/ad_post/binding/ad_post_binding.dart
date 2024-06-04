import 'package:classified_apps/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:classified_apps/apps/views/ads/repository/ads_repository.dart';
import 'package:classified_apps/apps/views/home/controller/home_controller.dart';
import 'package:get/get.dart';

class AdPostBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AdRepository>(() => AdRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => HomeController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => AdPostController(Get.find(), Get.find(), Get.find()));
  }
}
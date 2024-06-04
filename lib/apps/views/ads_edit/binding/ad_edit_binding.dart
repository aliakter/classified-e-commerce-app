import 'package:classified_apps/apps/views/ads/repository/ads_repository.dart';
import 'package:classified_apps/apps/views/ads_edit/controller/ad_edit_controller.dart';
import 'package:classified_apps/apps/views/home/controller/home_controller.dart';
import 'package:get/get.dart';

class AdEditBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut<AdRepository>(() => AdRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => AdEditController(Get.find(), Get.find(), Get.find()));
  }
}
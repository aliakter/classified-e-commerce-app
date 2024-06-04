import 'package:classified_apps/apps/views/ads/controller/ads_controller.dart';
import 'package:classified_apps/apps/views/ads/repository/ads_repository.dart';
import 'package:get/get.dart';

class AdsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AdRepository>(() => AdRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => AdsController(Get.find(),Get.find(), Get.find()));
  }
}
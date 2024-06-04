import 'package:classified_apps/apps/views/my_ads/controller/my_ads_controller.dart';
import 'package:classified_apps/apps/views/my_ads/repository/my_ads_repository.dart';
import 'package:get/get.dart';

class MyAdsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAdsRepository>(
        () => MyAdsRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => MyAdsController(Get.find(), Get.find()));
  }
}

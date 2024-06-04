import 'package:classified_apps/apps/views/price_planing/controller/price_planing_controller.dart';
import 'package:classified_apps/apps/views/price_planing/repository/price_planing_repository.dart';
import 'package:get/get.dart';

class PricePlaningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PricePlaningRepository>(
        () => PricePlaningRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => PricePlaningController(Get.find()));
  }
}

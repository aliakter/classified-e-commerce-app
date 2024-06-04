import 'package:classified_apps/apps/views/compare/repository/compare_repository.dart';
import 'package:get/get.dart';
import '../controller/compare_controller.dart';

class CompareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareRepository>(() => CompareRepositoryImpl(Get.find()));
    Get.lazyPut(() => CompareController(Get.find()));
  }
}

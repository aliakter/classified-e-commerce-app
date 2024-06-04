import 'package:classified_apps/apps/views/splash/languages/repository/language_repository.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageRepository>(() => LanguageRepositoryImp(remoteDataSource: Get.find(), localDataSource: Get.find()));
    Get.lazyPut(() => SplashController(Get.find(),Get.find()));
  }
}
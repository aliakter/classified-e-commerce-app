import 'package:classified_apps/apps/data/data_source/local_data_source.dart';
import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:classified_apps/apps/views/ads/repository/ads_repository.dart';
import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/apps/views/auth/repository/auth_repository.dart';
import 'package:classified_apps/apps/views/chat/controllers/chat_controller.dart';
import 'package:classified_apps/apps/views/chat_details/controller/chat_details_controller.dart';
import 'package:classified_apps/apps/views/home/controller/home_controller.dart';
import 'package:classified_apps/apps/views/home/repository/home_repository.dart';
import 'package:classified_apps/apps/views/main/controller/main_controller.dart';
import 'package:classified_apps/apps/views/splash/languages/repository/language_repository.dart';
import 'package:classified_apps/apps/views/wishlist/controller/wish_list_controller.dart';
import 'package:classified_apps/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/ad_post/controller/ad_post_controller.dart';
import '../views/splash/controller/splash_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<Client>(() => Client());
    Get.lazyPut<SharedPreferences>(() => sharedPreferences);
    Get.lazyPut<RemoteDataSource>(
        () => RemoteDataSourceImpl(client: Get.find()));
    Get.lazyPut<LocalDataSource>(
        () => LocalDataSourceImpl(sharedPreferences: Get.find()));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: Get.find(), localDataSource: Get.find()));
    Get.lazyPut<AdRepository>(
        () => AdRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: Get.find(), localDataSource: Get.find()));
    Get.lazyPut<LanguageRepository>(() => LanguageRepositoryImp(remoteDataSource: Get.find(), localDataSource: Get.find()));
    Get.lazyPut(() => SplashController(Get.find(),Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));
    Get.lazyPut(() => MainController(/*Get.find()*/));
    Get.lazyPut(() => AdPostController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => HomeController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => ChatController(Get.find(), Get.find()));
    Get.lazyPut(() => ChatDetailsController(Get.find(), Get.find()));
    Get.lazyPut(() => WishlistController(Get.find(), Get.find(), Get.find()));
  }
}

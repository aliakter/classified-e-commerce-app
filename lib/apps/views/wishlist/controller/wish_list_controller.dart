import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/apps/views/home/controller/home_controller.dart';
import 'package:classified_apps/apps/views/wishlist/model/wish_list_model.dart';
import 'package:classified_apps/main.dart';
import 'package:get/get.dart';
import '../reposotory/wishlist_repository.dart';

class WishlistController extends GetxController {
  final LoginController loginController;
  final WishlistRepository wishlistRepository;
  final HomeController homeController;

  WishlistController(this.loginController, this.wishlistRepository, this.homeController);

  String token = "";
  String userId = "";
  @override
  void onInit() {
    getToken();
    getWishlistData();
    super.onInit();
  }
  getToken(){
    token = sharedPreferences.getString("userToken")??"";
    userId = sharedPreferences.getString("userId")??"";
  }
  WishlistModel? wishlistModel;
  RxBool isLoading = false.obs;

  getWishlistData() async {
    isLoading.value = true;
    final result = await wishlistRepository
        .getWishlistData(token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      wishlistModel = data;
      isLoading.value = false;
    });
  }

  unselectWishlist(String id) async {
    final result = await wishlistRepository.unsetWishlist(
        token, id);
    result.fold((error) {
      Get.snackbar("Warning", error.message);
      print(error.message);
    }, (data) async {
      Utils.toastMsg(data);
      getWishlistData();
      homeController.getHomeData();
    });
  }
}

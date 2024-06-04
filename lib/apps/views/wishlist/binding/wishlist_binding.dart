import 'package:classified_apps/apps/views/wishlist/controller/wish_list_controller.dart';
import 'package:classified_apps/apps/views/wishlist/reposotory/wishlist_repository.dart';
import 'package:get/get.dart';

class FavouritelistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistRepository>(() => WishlistRepositoryImpl(Get.find()));
    Get.lazyPut<WishlistController>(
        () => WishlistController(Get.find(), Get.find(), Get.find()));
  }
}

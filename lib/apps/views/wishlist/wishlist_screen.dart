import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/views/wishlist/component/wish_list_produtc_container.dart';
import 'package:classified_apps/apps/views/wishlist/controller/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../splash/localization/app_localizations.dart';

class FavouriteListScreen extends GetView<WishlistController> {
  const FavouriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('wishlist_ads')!),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: iconThemeColor,
          ),
        ),
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () => Future.delayed(
            const Duration(seconds: 1),
            () => controller.getWishlistData(),
          ),
          child: controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : const CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    FavouriteListProductContainer(),
                  ],
                ),
        );
      }),
    );
  }
}

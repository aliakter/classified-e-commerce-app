import 'package:classified_apps/apps/core/utils/k_images.dart';
import 'package:classified_apps/apps/views/wishlist/component/wishlist_product_card.dart';
import 'package:classified_apps/apps/views/wishlist/controller/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FavouriteListProductContainer extends StatefulWidget {
  const FavouriteListProductContainer({super.key});

  @override
  State<FavouriteListProductContainer> createState() =>
      FavouriteListProductContainerState();
}

class FavouriteListProductContainerState extends State<FavouriteListProductContainer> {
  @override
  Widget build(BuildContext context) {
    WishlistController controller = Get.find();

    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
      sliver: MultiSliver(
        children: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              if (controller.wishlistModel!.data.isNotEmpty) {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 250),
                  delegate: SliverChildBuilderDelegate(
                    childCount: controller.wishlistModel!.data.length,
                    (BuildContext context, int pIndex) => FavouriteListProductCard(
                      adModel: controller.wishlistModel!.data[pIndex],
                    ),
                  ),
                );
              } else {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Image.asset(KImages.noDataImage),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

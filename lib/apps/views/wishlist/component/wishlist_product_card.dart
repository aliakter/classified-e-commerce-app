import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:classified_apps/apps/views/wishlist/controller/wish_list_controller.dart';
import 'package:classified_apps/apps/views/wishlist/model/wish_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteListProductCard extends StatelessWidget {
  final Datum adModel;

  const FavouriteListProductCard({super.key, required this.adModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.adDetailsScreen, arguments: adModel.ad.slug);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildImage()),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: ashColor)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: CustomImage(
                path: "${RemoteUrls.rootUrl}${adModel.ad.thumbnail}",
                fit: BoxFit.cover),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: IconButton(
              onPressed: () {
                Get.find<WishlistController>()
                    .unselectWishlist(adModel.ad.id.toString());
              },
              icon: const Icon(Icons.favorite, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.layers_outlined,
                color: Colors.grey,
                size: 20,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  adModel.ad.category?.name??"",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  adModel.ad.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                    color: paragraphColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                adModel.ad.price != null
                    ? "\$${adModel.ad.price}"
                    : "Negotiable",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(
                child: Text(
                  Utils.dateFormat(adModel.ad.createdAt),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

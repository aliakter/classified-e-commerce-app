import 'dart:math' as math;
import 'package:classified_apps/apps/global_widget/compare_button.dart';
import 'package:classified_apps/apps/global_widget/favorite_button.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:classified_apps/apps/views/home/models/ad_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/custom_image.dart';
import '../../../data/remote_urls.dart';

class ProductCard extends StatefulWidget {
  final AdsModel? adModel;
  final double? width;
  final String? from;
  final int? index;
  final int? myId;
  final int? sellerId;
  final int? logInUserId;
  final bool isMyShop;
  final Function()? onFavClick;

  const ProductCard(
      {super.key,
        this.adModel,
        this.width,
        this.from,
        this.index,
        this.myId,
        this.sellerId,
        this.isMyShop = false,
        this.logInUserId,
        this.onFavClick});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: InkWell(
        onTap: () {
          if (widget.isMyShop) {
            Get.toNamed(Routes.adDetailsScreen,
                arguments: widget.adModel!.slug);
          } else {
            Get.toNamed(Routes.adDetailsScreen,
                arguments: widget.adModel!.slug);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildImage()),
            _buildContent(context, widget.onFavClick ?? () => null)
          ],
        ),
      ),
    );
  }

  Widget _buildContent(context, Function() favClick) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.adModel!.price != null && widget.adModel!.price != "0.00"
                ? "\£ ${widget.adModel!.price}"
                : "Negotiable",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 5),
          SizedBox(
            child: Text(
              widget.adModel?.title ?? "",
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
          const SizedBox(height: 5),
          SizedBox(
            child: Text(
              widget.adModel?.category?.name ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold, height: 1),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: widget.adModel?.city != '',
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey.shade500,
                          size: 16,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.adModel?.city ?? "",
                          maxLines: 1,
                          style: TextStyle(color: Colors.grey.shade500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.logInUserId != widget.adModel!.userId ||
                      widget.logInUserId == 0,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey.shade200,
                          child: CompareButton(
                            productId: int.parse("${widget.adModel?.id}"),
                            index: widget.index,
                            adsUserId: widget.adModel!.customer!.id,
                            logInUserId: widget.logInUserId,
                            from: widget.from,
                          ),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: favClick,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey.shade200,
                            child: FavoriteButton(
                              productId: widget.adModel!.id,
                              isFav: widget.adModel!.isWishlist,
                              from: widget.from,
                              adsUserId: widget.adModel!.customer!.id,
                              logInUserId: widget.logInUserId,
                              onFavClick: favClick,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12)
        ],
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
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: CustomImage(
                path: widget.adModel!.thumbnail != ''
                    ? '${RemoteUrls.rootUrl}${widget.adModel!.thumbnail}'
                    : null,
                fit: BoxFit.cover),
          ),
          Visibility(
            visible: widget.adModel!.featured == 1,
            child: Positioned(
              top: 10,
              left: -4,
              child: Transform.rotate(
                angle: -math.pi / 4.1,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                      color: const Color(0xFF2DBE6C),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    'Featured',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math' as math;
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/global_widget/compare_button.dart';
import 'package:classified_apps/apps/global_widget/favorite_button.dart';
import 'package:classified_apps/apps/views/home/models/ad_model.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/custom_image.dart';

class ListProductCard extends StatefulWidget {
  AdsModel adsModel;
  final int? logInUserId;
  final int? productID;
  final String? form;
  final int index;
  final double? width;
  Function()? onFavClick;
  Function()? onCompareClick;

  ListProductCard(
      {super.key,
        this.logInUserId,
        this.productID,
        required this.adsModel,
        this.form,
        this.width,
        required this.index,
        this.onFavClick,
        this.onCompareClick});

  @override
  State<ListProductCard> createState() => _ListProductCardState();
}

class _ListProductCardState extends State<ListProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6), topRight: Radius.circular(6)),
      ),
      height: 150,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: CustomImage(
              path: "${RemoteUrls.rootUrl}${widget.adsModel.thumbnail}",
              fit: BoxFit.cover,
            ),
          ),
          Visibility(
            visible: widget.adsModel.featured == 1,
            child: Positioned(
              top: 18,
              left: -6,
              child: Transform.rotate(
                angle: -math.pi / 4.1,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: const Color(0xFF2DBE6C),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    'Featured',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            widget.adsModel.price != null && widget.adsModel.price != "0.00"
                ? "\£ ${widget.adsModel.price}"
                : "Negotiable",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                height: 1.5, color: blackColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          SizedBox(
            child: Text(
              widget.adsModel.title,
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
          Visibility(
            visible: widget.adsModel.category?.name != "",
            child: SizedBox(
              child: Text(
                widget.adsModel.category?.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold, height: 1),
              ),
            ),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.adsModel.city != '',
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey.shade500,
                        size: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.adsModel.city,
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey.shade500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: widget.logInUserId != widget.adsModel.userId ||
                    widget.logInUserId == 0,
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey.shade300,
                        child: CompareButton(
                          productId: int.parse("${widget.adsModel.id}"),
                          adsUserId: widget.adsModel.userId,
                          logInUserId: widget.logInUserId,
                          index: widget.index,
                          from: widget.form,
                        ),
                      ),
                      const SizedBox(width: 2),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey.shade200,
                        child: FavoriteButton(
                          productId: widget.adsModel.id,
                          isFav: widget.adsModel.isWishlist,
                          adsUserId: widget.adsModel.customer?.id,
                          logInUserId: widget.logInUserId,
                          from: widget.form,
                          onFavClick: widget.onFavClick,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

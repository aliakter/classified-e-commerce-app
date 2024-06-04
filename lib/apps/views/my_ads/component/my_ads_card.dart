import 'dart:math' as math;
import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:classified_apps/apps/views/my_ads/controller/my_ads_controller.dart';
import 'package:classified_apps/apps/views/my_ads/model/user_ads_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../splash/localization/app_localizations.dart';

class CustomerAdListCard extends StatefulWidget {
  final Datum adModel;
  final MyAdsController myAdsController;

  const CustomerAdListCard(
      {super.key, required this.adModel, required this.myAdsController});

  @override
  State<CustomerAdListCard> createState() => _CustomerAdListCardState();
}

class _CustomerAdListCardState extends State<CustomerAdListCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.adDetailsScreen, arguments: widget.adModel.slug);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            const SizedBox(height: 0),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return SizedBox(
      height: 150,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
              child: CustomImage(
                path: "${RemoteUrls.rootUrl}${widget.adModel.thumbnail}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: -4,
            child: Transform.rotate(
              angle: -math.pi / 4.1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: const Color(0xFF2DBE6C),
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  AppLocalizations.of(context).translate('featured')!,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContent(context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          border: Border.fromBorderSide(
              BorderSide(color: Color(0xffd5d2d2), width: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.layers_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    widget.adModel.category.name,
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
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    widget.adModel.title,
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.yellow,
                  ),
                  child: Text(
                    widget.myAdsController.capitalize(widget.adModel.status),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: widget.adModel.address != '',
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey.shade500,
                        size: 16,
                      ),
                      Text(
                        widget.adModel.address,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Text(
                  Utils.dateFormat("${widget.adModel.createdAt}"),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const Divider(color: Color(0xffd5d2d2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.adModel.price != null
                      ? '\$ ${widget.adModel.price}'
                      : "Negotiable",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 5),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.adsEdit,
                              arguments: widget.adModel.id.toString());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF198754)),
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () async {
                          Utils.showCustomDialog(context,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                height: 150,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Are you sure?",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Do you want to delete this ad?",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              foregroundColor: redColor),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Cancel"),
                                        ),
                                        Obx(
                                          () => widget.myAdsController
                                                  .isDeleteLoading.value
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: redColor))
                                              : TextButton(
                                                  style: TextButton.styleFrom(
                                                      foregroundColor:
                                                          redColor),
                                                  onPressed: () async {
                                                    widget.myAdsController
                                                        .deleteAds(widget
                                                            .adModel.id
                                                            .toString());
                                                  },
                                                  child: const Text("Ok"),
                                                ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
                          ),
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

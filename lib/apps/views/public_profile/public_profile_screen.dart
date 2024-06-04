import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/core/utils/k_images.dart';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/views/home/component/product_card.dart';
import 'package:classified_apps/apps/views/home/component/shimmer_list.dart';
import 'package:classified_apps/apps/views/home/controller/home_controller.dart';
import 'package:classified_apps/apps/views/public_profile/component/saller_info.dart';
import 'package:classified_apps/apps/views/public_profile/controller/public_profile_controller.dart';
import 'package:classified_apps/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../splash/localization/app_localizations.dart';

class PublicProfileScreen extends StatelessWidget {
  const PublicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicProfileController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title:
              Text(AppLocalizations.of(context).translate('public_profile')!),
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
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: ShimmerList())
              : RefreshIndicator(
            onRefresh: () => controller.getPublicProfile(),
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                ///SELLER INFO SECTION
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  sliver: SliverToBoxAdapter(
                    child: SellerInfo(
                        user: controller.publicProfileModel!,
                        controller: controller),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ///BUTTONS SECTIONS
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changeBtnOne();
                                  },
                                  child: Container(
                                    height: 46,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: controller.shopSelect.value
                                          ? redColor
                                          : Colors.transparent,
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                    child: Text("Shop",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: controller.shopSelect.value
                                              ? Colors.white
                                              : Colors.black,
                                        )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changeBtnTwo();
                                  },
                                  child: Container(
                                    height: 46,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: controller
                                          .sellerReviewSelect.value
                                          ? redColor
                                          : Colors.transparent,
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                    child: Text("Seller Review",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: controller
                                              .sellerReviewSelect.value
                                              ? Colors.white
                                              : Colors.black,
                                        )),
                                  ),
                                ),
                              ),
                              controller.isMe(controller
                                  .publicProfileModel!.user.id)
                                  ? const SizedBox()
                                  : Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changeBtnThree();
                                  },
                                  child: Container(
                                    height: 46,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: controller
                                          .writeReviewSelect.value
                                          ? redColor
                                          : Colors.transparent,
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Write Review",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: controller
                                            .writeReviewSelect
                                            .value
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 16),
                  sliver: SliverLayoutBuilder(
                    builder: (context, constraints) {
                      if (controller.shopSelect.value) {
                        return controller
                            .publicProfileModel!.recentAds.isNotEmpty
                            ? MultiSliver(children: [
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${controller.publicProfileModel?.totalActiveAd}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text(
                                      " Item Available Listings",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Obx(() => SizedBox(
                                  width: Get.width,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                    const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                      mainAxisExtent: 250,
                                    ),
                                    itemCount: controller
                                        .recentAds.length,
                                    itemBuilder:
                                        (BuildContext context,
                                        int pIndex) {
                                      return ProductCard(
                                        isMyShop: true,
                                        adModel: controller
                                            .recentAds[pIndex],
                                        from: 'public_shop',
                                        index: pIndex,
                                        logInUserId: controller
                                            .userId ==
                                            ""
                                            ? 0
                                            : int.parse(controller
                                            .userId),
                                        onFavClick: () {
                                          var userId =
                                          sharedPreferences
                                              .getString(
                                              "userId");
                                          if (userId == null) {
                                            Get.snackbar(
                                                "Warning",
                                                'Login please',
                                                colorText: Colors
                                                    .red.shade300,
                                                backgroundColor:
                                                Colors.white);
                                          } else {
                                            if (int.parse(
                                                userId) ==
                                                controller
                                                    .recentAds[
                                                pIndex]
                                                    .userId) {
                                              Utils.showSnackBar(
                                                  context,
                                                  "You can not add your ads to your favorite list ");
                                            } else {
                                              Get.find<PublicProfileController>()
                                                  .publicProfileModel!
                                                  .recentAds[
                                              pIndex]
                                                  .isWishlist =
                                              !controller
                                                  .publicProfileModel!
                                                  .recentAds[
                                              pIndex]
                                                  .isWishlist;
                                              Get.find<
                                                  HomeController>()
                                                  .setUnsetWishlist(controller
                                                  .publicProfileModel!
                                                  .recentAds[
                                              pIndex]
                                                  .id
                                                  .toString());
                                              controller.update();
                                            }
                                          }
                                        },
                                      );
                                    },
                                  ),
                                )),
                                Obx(
                                      () => Visibility(
                                    visible: controller
                                        .isMoreLoading.value,
                                    child: const Column(
                                      children: [
                                        SizedBox(height: 16),
                                        SizedBox(
                                          child: Center(
                                              child:
                                              CircularProgressIndicator()),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ])
                            : SliverFillRemaining(
                          hasScrollBody: false,
                          child: SizedBox(
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(6),
                                      border: Border.all(
                                          color: Colors.black54)),
                                  child: const Text(
                                    "Ads Not Found",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                          ),
                        );
                      }
                      if (controller.sellerReviewSelect.value) {
                        if (controller
                            .publicProfileModel!.reviews.isNotEmpty) {
                          return SliverToBoxAdapter(
                              child: SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height,
                                  child: ListView.separated(
                                    physics:
                                    const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .publicProfileModel!.reviews.length,
                                    itemBuilder: (context, index) {
                                      var reviewData = controller
                                          .publicProfileModel!
                                          .reviews[index];
                                      return Container(
                                        padding: EdgeInsets.all(5.h),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      3),
                                                  decoration:
                                                  const BoxDecoration(
                                                    color: paragraphColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(100),
                                                    child: CustomImage(
                                                      path: reviewData.user
                                                          .image !=
                                                          ''
                                                          ? '${RemoteUrls.rootUrl}${reviewData.user.image}'
                                                          : null,
                                                      height: 40.h,
                                                      width: 40.h,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      reviewData.user.name,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                    const SizedBox(
                                                        height: 3),
                                                    RatingBarIndicator(
                                                      itemCount: 5,
                                                      itemSize: 13.0,
                                                      direction:
                                                      Axis.horizontal,
                                                      rating: double.parse(
                                                          "${reviewData.stars}"),
                                                      itemBuilder: (context,
                                                          index) =>
                                                      const Icon(
                                                        Icons.star,
                                                        color: Color(
                                                            0xffF0A732),
                                                      ),
                                                    ),
                                                    Text(
                                                      controller
                                                          .publicProfileModel!
                                                          .reviews[index]
                                                          .comment,
                                                      style: TextStyle(
                                                          fontSize: 14.sp),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(height: 10);
                                    },
                                  )));
                        } else {
                          return SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(6),
                                      border: Border.all(
                                          color: Colors.black54)),
                                  child: const Text(
                                    "Review not found",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                          );
                        }
                      }
                      if (controller.writeReviewSelect.value) {
                        return SliverToBoxAdapter(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                              Border.all(color: Colors.grey.shade300),
                              color: Colors.grey.shade300,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: RatingBar.builder(
                                    itemCount: 5,
                                    initialRating:
                                    controller.ratingValue.value,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemSize: 20.0,
                                    itemPadding:
                                    const EdgeInsets.only(right: 4),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Color(0xffF0A732),
                                    ),
                                    onRatingUpdate: (rating) {
                                      controller.ratingChange(rating);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  child: TextFormField(
                                    controller: controller.reviewController,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                        hintText: "Write Review"),
                                  ),
                                ),
                                Obx(() => controller.isSetReview.value
                                    ? const Center(
                                    child: CircularProgressIndicator())
                                    : Center(
                                  child: SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: ElevatedButton(
                                      style: OutlinedButton.styleFrom(
                                        elevation: 5,
                                        shadowColor:
                                        Colors.grey.shade300,
                                        backgroundColor: redColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              4),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (controller.token == "") {
                                          Get.snackbar("Warning",
                                              'Login please',
                                              colorText:
                                              Colors.red.shade300,
                                              backgroundColor:
                                              Colors.white);
                                        } else {
                                          controller.setReview();
                                        }
                                      },
                                      child: Text(controller
                                          .reviewController
                                          .text
                                          .isEmpty
                                          ? 'Save'
                                          : 'Update'),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox());
                    },
                  ),
                ),
              ],
            ),
          ),
          // RefreshIndicator(
          //         key: controller.refreshIndicatorKey,
          //         onRefresh: () => Future.delayed(
          //           const Duration(seconds: 1),
          //           () => controller.getPublicProfile(),
          //         ),
          //         child: CustomScrollView(
          //           slivers: [
          //             ///SELLER INFO SECTION
          //             SliverPadding(
          //               padding: const EdgeInsets.symmetric(
          //                   horizontal: 16, vertical: 8),
          //               sliver: SliverToBoxAdapter(
          //                 child:
          //                     SellerInfo(user: controller.publicProfileModel!),
          //               ),
          //             ),
          //             SliverPadding(
          //               padding: const EdgeInsets.symmetric(
          //                   horizontal: 16, vertical: 8),
          //               sliver: SliverToBoxAdapter(
          //                 child: Column(
          //                   children: [
          //                     ///BUTTONS SECTIONS
          //                     Container(
          //                       padding: const EdgeInsets.symmetric(
          //                           vertical: 5, horizontal: 5),
          //                       decoration: BoxDecoration(
          //                           color: Colors.white,
          //                           borderRadius: BorderRadius.circular(30)),
          //                       child: Row(
          //                         children: [
          //                           Expanded(
          //                             child: GestureDetector(
          //                               onTap: () {
          //                                 controller.changeBtnOne();
          //                               },
          //                               child: Container(
          //                                 height: 46,
          //                                 alignment: Alignment.center,
          //                                 decoration: BoxDecoration(
          //                                   color: controller.shopSelect.value
          //                                       ? redColor
          //                                       : Colors.transparent,
          //                                   borderRadius:
          //                                       BorderRadius.circular(30),
          //                                 ),
          //                                 child: Text(
          //                                     AppLocalizations.of(context)
          //                                         .translate('shop')!,
          //                                     style: TextStyle(
          //                                       fontSize: 12,
          //                                       fontWeight: FontWeight.bold,
          //                                       color:
          //                                           controller.shopSelect.value
          //                                               ? Colors.white
          //                                               : Colors.black,
          //                                     )),
          //                               ),
          //                             ),
          //                           ),
          //                           Expanded(
          //                             child: GestureDetector(
          //                               onTap: () {
          //                                 controller.changeBtnTwo();
          //                               },
          //                               child: Container(
          //                                 height: 46,
          //                                 alignment: Alignment.center,
          //                                 decoration: BoxDecoration(
          //                                   color: controller
          //                                           .sellerReviewSelect.value
          //                                       ? redColor
          //                                       : Colors.transparent,
          //                                   borderRadius:
          //                                       BorderRadius.circular(30),
          //                                 ),
          //                                 child: Text(
          //                                     AppLocalizations.of(context)
          //                                         .translate('seller_review')!,
          //                                     style: TextStyle(
          //                                       fontSize: 12,
          //                                       fontWeight: FontWeight.bold,
          //                                       color: controller
          //                                               .sellerReviewSelect
          //                                               .value
          //                                           ? Colors.white
          //                                           : Colors.black,
          //                                     )),
          //                               ),
          //                             ),
          //                           ),
          //                           controller.isMe(controller
          //                                   .publicProfileModel!.user.id)
          //                               ? const SizedBox()
          //                               : Expanded(
          //                                   child: GestureDetector(
          //                                     onTap: () {
          //                                       controller.changeBtnThree();
          //                                     },
          //                                     child: Container(
          //                                       height: 46,
          //                                       alignment: Alignment.center,
          //                                       decoration: BoxDecoration(
          //                                         color: controller
          //                                                 .writeReviewSelect
          //                                                 .value
          //                                             ? redColor
          //                                             : Colors.transparent,
          //                                         borderRadius:
          //                                             BorderRadius.circular(30),
          //                                       ),
          //                                       child: Text(
          //                                         AppLocalizations.of(context)
          //                                             .translate(
          //                                                 'write_review')!,
          //                                         style: TextStyle(
          //                                           fontSize: 12,
          //                                           fontWeight: FontWeight.bold,
          //                                           color: controller
          //                                                   .writeReviewSelect
          //                                                   .value
          //                                               ? Colors.white
          //                                               : Colors.black,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 )
          //                         ],
          //                       ),
          //                     ),
          //                     const SizedBox(height: 20),
          //                     LayoutBuilder(
          //                       builder: (p0, p1) {
          //                         if (controller.shopSelect.value) {
          //                           return controller.publicProfileModel!
          //                                   .recentAds.isNotEmpty
          //                               ? Column(
          //                                   crossAxisAlignment:
          //                                       CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text(
          //                                       "${controller.publicProfileModel!.recentAds.length} Item Available Listings",
          //                                       style: const TextStyle(
          //                                         fontWeight: FontWeight.w600,
          //                                       ),
          //                                     ),
          //                                     const SizedBox(height: 20),
          //                                     SizedBox(
          //                                       width: Get.width,
          //                                       child: GridView.builder(
          //                                         shrinkWrap: true,
          //                                         physics:
          //                                             const NeverScrollableScrollPhysics(),
          //                                         gridDelegate:
          //                                             const SliverGridDelegateWithFixedCrossAxisCount(
          //                                           crossAxisCount: 2,
          //                                           crossAxisSpacing: 8,
          //                                           mainAxisSpacing: 8,
          //                                           mainAxisExtent: 250,
          //                                         ),
          //                                         itemCount: controller
          //                                             .publicProfileModel!
          //                                             .recentAds
          //                                             .length,
          //                                         itemBuilder:
          //                                             (context, index) {
          //                                           return ProductCard(
          //                                             adModel: controller
          //                                                 .publicProfileModel!
          //                                                 .recentAds[index],
          //                                             from: 'public_shop',
          //                                             myId: controller
          //                                                 .publicProfileModel!
          //                                                 .user
          //                                                 .id,
          //                                             sellerId: controller
          //                                                 .publicProfileModel!
          //                                                 .recentAds[index]
          //                                                 .customer
          //                                                 .id,
          //                                             logInUserId: controller
          //                                                         .userId ==
          //                                                     ""
          //                                                 ? null
          //                                                 : int.parse(controller
          //                                                     .userId),
          //                                           );
          //                                         },
          //                                       ),
          //                                     ),
          //                                     const SizedBox(height: 5),
          //                                   ],
          //                                 )
          //                               : SizedBox(
          //                                   child: Padding(
          //                                     padding: const EdgeInsets.only(
          //                                         top: 70),
          //                                     child: Image.asset(
          //                                         KImages.noDataImage),
          //                                   ),
          //                                 );
          //                         }
          //
          //                         if (controller.sellerReviewSelect.value) {
          //                           if (controller.publicProfileModel!.reviews
          //                               .isNotEmpty) {
          //                             return SizedBox(
          //                                 height: MediaQuery.of(context)
          //                                     .size
          //                                     .height,
          //                                 child: ListView.separated(
          //                                   physics:
          //                                       const NeverScrollableScrollPhysics(),
          //                                   shrinkWrap: true,
          //                                   itemCount: controller
          //                                       .publicProfileModel!
          //                                       .reviews
          //                                       .length,
          //                                   itemBuilder: (context, index) {
          //                                     return Container(
          //                                       padding:
          //                                           const EdgeInsets.all(16),
          //                                       decoration: BoxDecoration(
          //                                         borderRadius:
          //                                             BorderRadius.circular(10),
          //                                         color: Colors.white,
          //                                       ),
          //                                       child: Column(
          //                                         crossAxisAlignment:
          //                                             CrossAxisAlignment.start,
          //                                         children: [
          //                                           Row(
          //                                             children: [
          //                                               Container(
          //                                                 padding:
          //                                                     const EdgeInsets
          //                                                         .all(3),
          //                                                 decoration:
          //                                                     const BoxDecoration(
          //                                                   color:
          //                                                       paragraphColor,
          //                                                   shape:
          //                                                       BoxShape.circle,
          //                                                 ),
          //                                                 child: ClipRRect(
          //                                                   borderRadius:
          //                                                       BorderRadius
          //                                                           .circular(
          //                                                               100),
          //                                                   child: CustomImage(
          //                                                     path: controller
          //                                                                 .publicProfileModel!
          //                                                                 .user
          //                                                                 .imageUrl !=
          //                                                             ''
          //                                                         ? '${RemoteUrls.rootUrl}${controller.publicProfileModel!.user.imageUrl}'
          //                                                         : null,
          //                                                     height: 50,
          //                                                     width: 50,
          //                                                     fit: BoxFit.cover,
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                               const SizedBox(
          //                                                   width: 10),
          //                                               Column(
          //                                                 crossAxisAlignment:
          //                                                     CrossAxisAlignment
          //                                                         .start,
          //                                                 children: [
          //                                                   Text(
          //                                                     controller
          //                                                         .publicProfileModel!
          //                                                         .reviews[
          //                                                             index]
          //                                                         .user
          //                                                         .username,
          //                                                     style: const TextStyle(
          //                                                         fontSize: 14,
          //                                                         fontWeight:
          //                                                             FontWeight
          //                                                                 .bold),
          //                                                   ),
          //                                                   const SizedBox(
          //                                                       height: 3),
          //                                                   RatingBarIndicator(
          //                                                     itemCount: 5,
          //                                                     itemSize: 20.0,
          //                                                     direction: Axis
          //                                                         .horizontal,
          //                                                     rating: double.parse(
          //                                                         "${controller.publicProfileModel!.reviews[index].stars}"),
          //                                                     itemBuilder: (context,
          //                                                             index) =>
          //                                                         const Icon(
          //                                                       Icons.star,
          //                                                       color: Color(
          //                                                           0xffF0A732),
          //                                                     ),
          //                                                   ),
          //                                                 ],
          //                                               ),
          //                                             ],
          //                                           ),
          //                                           const SizedBox(height: 12),
          //                                           Text(
          //                                             controller
          //                                                 .publicProfileModel!
          //                                                 .reviews[index]
          //                                                 .comment,
          //                                             style: const TextStyle(
          //                                               fontSize: 14,
          //                                             ),
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     );
          //                                   },
          //                                   separatorBuilder:
          //                                       (BuildContext context,
          //                                           int index) {
          //                                     return const SizedBox(height: 10);
          //                                   },
          //                                 ));
          //                           } else {
          //                             return SizedBox(
          //                               child: Padding(
          //                                 padding:
          //                                     const EdgeInsets.only(top: 70),
          //                                 child:
          //                                     Image.asset(KImages.noDataImage),
          //                               ),
          //                             );
          //                           }
          //                         }
          //
          //                         if (controller.writeReviewSelect.value) {
          //                           return Container(
          //                             padding: const EdgeInsets.symmetric(
          //                                 horizontal: 10, vertical: 15),
          //                             decoration: BoxDecoration(
          //                               borderRadius: BorderRadius.circular(5),
          //                               border: Border.all(
          //                                   color: Colors.grey.shade300),
          //                               color: Colors.white,
          //                             ),
          //                             child: Column(
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                               children: [
          //                                 Center(
          //                                   child: RatingBar.builder(
          //                                     itemCount: 5,
          //                                     initialRating: 0,
          //                                     direction: Axis.horizontal,
          //                                     allowHalfRating: true,
          //                                     itemSize: 20.0,
          //                                     itemPadding:
          //                                         const EdgeInsets.only(
          //                                             right: 4),
          //                                     itemBuilder: (context, _) =>
          //                                         const Icon(
          //                                       Icons.star,
          //                                       color: Color(0xffF0A732),
          //                                     ),
          //                                     onRatingUpdate: (rating) {
          //                                       controller.ratingChange(rating);
          //                                     },
          //                                   ),
          //                                 ),
          //                                 Padding(
          //                                   padding: const EdgeInsets.symmetric(
          //                                       vertical: 10),
          //                                   child: TextFormField(
          //                                     controller:
          //                                         controller.reviewController,
          //                                     maxLines: 5,
          //                                     decoration: InputDecoration(
          //                                         border: OutlineInputBorder(
          //                                           borderRadius:
          //                                               BorderRadius.circular(
          //                                                   5),
          //                                           borderSide:
          //                                               const BorderSide(
          //                                                   color: Colors.grey),
          //                                         ),
          //                                         hintText: AppLocalizations.of(
          //                                                 context)
          //                                             .translate(
          //                                                 'write_review')!),
          //                                   ),
          //                                 ),
          //                                 Obx(() => controller.isSetReview.value
          //                                     ? const Center(
          //                                         child:
          //                                             CircularProgressIndicator())
          //                                     : Center(
          //                                         child: SizedBox(
          //                                           height: 40,
          //                                           width: 90,
          //                                           child: ElevatedButton(
          //                                             style: OutlinedButton
          //                                                 .styleFrom(
          //                                               elevation: 5,
          //                                               shadowColor: Colors
          //                                                   .grey.shade300,
          //                                               backgroundColor:
          //                                                   redColor,
          //                                               shape:
          //                                                   RoundedRectangleBorder(
          //                                                 borderRadius:
          //                                                     BorderRadius
          //                                                         .circular(5),
          //                                               ),
          //                                             ),
          //                                             onPressed: () {
          //                                               if (controller.token !=
          //                                                   "") {
          //                                                 controller
          //                                                     .setReview();
          //                                               } else {
          //                                                 Get.snackbar(
          //                                                     "Warning",
          //                                                     'Login please',
          //                                                     colorText: Colors
          //                                                         .red.shade300,
          //                                                     backgroundColor:
          //                                                         Colors.white);
          //                                               }
          //                                             },
          //                                             child: Text(
          //                                                 AppLocalizations.of(
          //                                                         context)
          //                                                     .translate(
          //                                                         'save')!),
          //                                           ),
          //                                         ),
          //                                       )),
          //                               ],
          //                             ),
          //                           );
          //                         }
          //                         return Container();
          //                       },
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
        ),
      );
    });
  }
}

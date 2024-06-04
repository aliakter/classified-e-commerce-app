import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:classified_apps/apps/core/utils/k_images.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:classified_apps/apps/views/home/models/ad_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/constants.dart';
import '../controller/home_controller.dart';
import 'list_product_card.dart';

class HorizontalProductContainer extends GetView<HomeController> {
  const HorizontalProductContainer(
      {super.key, required this.adsModel, required this.title});

  final List<AdsModel> adsModel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.carouselController.previousPage();
                    },
                    onTapDown: controller.onTapPreviousDown,
                    onTapUp: controller.onTapPreviousUp,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey.shade300),
                        color: controller.isPreviousTap.value
                            ? redColor
                            : Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: controller.isPreviousTap.value
                            ? Colors.white
                            : redColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      controller.carouselController.nextPage();
                    },
                    onTapDown: controller.onTapNextDown,
                    onTapUp: controller.onTapNextUp,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey.shade300),
                        color: controller.isNextTap.value
                            ? redColor
                            : Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: controller.isNextTap.value
                            ? Colors.white
                            : redColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            child: LayoutBuilder(builder: (context, constraints) {
              if (adsModel.isEmpty) {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(KImages.noDataImage),
                  ),
                );
              }
              return SizedBox(
                height: 220,
                child: CarouselSlider.builder(
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () {
                        log("--------------->>> button is pressed");
                        Get.back();
                        Get.toNamed(Routes.adDetailsScreen,
                            arguments: adsModel[index].slug);
                      },
                      child: ListProductCard(
                        adsModel: adsModel[index],
                        logInUserId: int.parse(controller.userId),
                        index: index,
                        // form: 'details_page',
                      ),
                    );
                  },
                  itemCount: adsModel.length,
                  options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    autoPlay: false,
                    viewportFraction: 1.5,
                    height: 220,
                  ),
                  carouselController: controller.carouselController,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

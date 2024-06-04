import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompareButton extends StatelessWidget {
  const CompareButton(
      {super.key,
      required this.productId,
      this.from,
      this.index,
      this.adsUserId,
      this.logInUserId});

  final int productId;
  final String? from;
  final int? index;
  final int? adsUserId;
  final int? logInUserId;

  final double height = 28;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () async {
          if (logInUserId == adsUserId) {
            Utils.toastMsg("You can not add your ads to your compare list");
          } else {
            ///check for 3 item limit
            // if (Get.find<HomeController>().compareList.length < 3) {
            ///remove from compare list.
            if (Get.find<HomeController>().compareList.contains(productId)) {
              Utils.toastMsg("Item remove from your compare list");
              Get.find<HomeController>().removedFromCompareList(productId);
            } else {
              ///add to compare list
              Utils.toastMsg("Item added to your compare list");
              Get.find<HomeController>().addToCompareList(productId);
            }
          }
        },
        child: Get.find<HomeController>().compareList.contains(productId) ||
                Get.find<HomeController>().checkIfCompareList(productId)
            ? const Icon(
                Icons.change_circle,
                color: Colors.black,
                size: 20,
              )
            : Icon(
                Icons.change_circle_outlined,
                color: Colors.grey.shade500,
                size: 20,
              ),
      );
    });
  }
}

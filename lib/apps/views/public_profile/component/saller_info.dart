import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:classified_apps/apps/views/public_profile/controller/public_profile_controller.dart';
import 'package:classified_apps/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/utils/utils.dart';
import '../../splash/localization/app_localizations.dart';
import '../model/public_profile_model.dart';

class SellerInfo extends StatelessWidget {

  const SellerInfo({super.key, required this.user, required this.controller});

  final PublicProfileController controller;
  final PublicProfileModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 1)
        ],
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            color: redColor,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CustomImage(
              path: user.user.image != ''
                  ? "${RemoteUrls.rootUrl}${user.user.image}"
                  : null,
              height: 50.h,
              width: 50.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.user.username,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                RatingBarIndicator(
                  rating: double.parse(user.ratingDetails.average),
                  itemBuilder: (context, index) =>
                  const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 22.0,
                  direction: Axis.horizontal,
                ),
                const SizedBox(width: 5),
                Text("${user.ratingDetails.total} ",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text("Review"),
              ],
            ),
            Row(
              children: [
                const Text("Email: "),
                Text(user.user.email, style: const TextStyle(color: redColor),),
              ],
            ),
            Visibility(
              visible: controller.userId != user.user.id.toString(),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 36,
                  width: 200,
                  child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.grey.shade300,
                      backgroundColor: redColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      var userId = sharedPreferences.getString("userId");
                      if (userId == null) {
                        Get.snackbar("Warning", 'Login please',
                            colorText: Colors.red.shade300,
                            backgroundColor: Colors.white);
                      }else {
                        if (int.parse(
                            Get.find<PublicProfileController>().userId) ==
                            user.user.id) {
                          Utils.toastMsg("You can not message with yourself");
                          return;
                        } else {
                          Get.toNamed(Routes.chatDetails,
                              arguments: user.user.username);
                        }
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.question_answer_outlined, size: 18),
                        SizedBox(width: 10),
                        Text(
                          'Chat With Seller',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

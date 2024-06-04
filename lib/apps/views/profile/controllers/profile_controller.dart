import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import '../../../../main.dart';
import '../../home/controller/home_controller.dart';

class ProfileController extends GetxController {
  final HomeController homeController;

  ProfileController(this.homeController);

  final scrollController = ScrollController();
  String token = "";
  String userId = "";
  String userFullName = "";
  String username = "";
  String userEmail = "";
  String userPhone = "";
  String userWebsite = "";
  String userImage = "";

  @override
  void onInit() {
    super.onInit();
    getToken();
  }

  getToken() {
    token = sharedPreferences.getString("userToken") ?? "";
    userId = sharedPreferences.getString("userId") ?? "";
    userFullName = sharedPreferences.getString("userFullName") ?? "";
    username = sharedPreferences.getString("username") ?? "";
    userEmail = sharedPreferences.getString("userEmail") ?? "";
    userPhone = sharedPreferences.getString("userPhone") ?? "";
    userWebsite = sharedPreferences.getString("userWebsite") ?? "";
    userImage = sharedPreferences.getString("userImage") ?? "";
  }

  void toTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void showLogoutDialog(context) async {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      curve: Curves.easeInOut,
      alignment: Alignment.center,
      animationType: DialogTransitionType.scale,
      duration: const Duration(milliseconds: 500),
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: SingleChildScrollView(
            child: Container(
              height: Get.height / 5.7,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Are you sure to logout from this device?',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 35,
                            width: 50,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'No',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            sharedPreferences.clear();
                            Get.offAllNamed(Routes.login);
                          },
                          child: Container(
                            height: 35,
                            width: 55,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: redColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'dart:developer';
import 'package:classified_apps/apps/core/utils/colors.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.black,
        leading: GestureDetector(
          onTap: () {
            Get.offAndToNamed(Routes.main);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: Get.size.height * 0.02,
              ),
            ),

            ///TOP HEADER
            SliverPadding(
              padding: const EdgeInsets.symmetric(),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CustomImage(
                            path: controller
                                        .settingModel.value!.data.logoImage !=
                                    ''
                                ? "${RemoteUrls.rootUrl}${controller.settingModel.value!.data.logoImage}"
                                : null,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 50)),

            ///Text input fields
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email'),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: controller.emailCtr,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: "Enter your email",
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Password'),
                    const SizedBox(height: 5),
                    Obx(() {
                      return TextFormField(
                        controller: controller.passwordCtl,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.obscureText.value,
                        decoration: InputDecoration(
                            hintText: "Enter your password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.toggle();
                              },
                              child: controller.obscureText.value
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black87,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black87,
                                    ),
                            )),
                      );
                    })
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            ///Forget password
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              sliver: SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.forgotPass);
                    },
                    child: const Text(
                      "Forget password?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                  child: Obx(() => SizedBox(
                    height: 48,
                    child: ElevatedButton(
                          style: OutlinedButton.styleFrom(
                            elevation: 5,
                            shadowColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            controller.login();
                          },
                          child: Center(
                            child: controller.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white))
                                : const Text(
                                    'Log In',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                  ))),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),

            ///TOP HEADER
            SliverPadding(
              padding: const EdgeInsets.symmetric(),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Don't have an account?"),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.signup);
                        },
                        child: Text(
                          'register',
                          style: TextStyle(
                            color: AppColors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),

            const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'or',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.handleGoogleSignIn();
                    },
                    child: Container(
                      height: Get.height * 0.1,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          image: AssetImage("assets/social/google.png"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () async {
                      UserCredential? userCredential = await controller.handleFbSignIn();
                      if (userCredential != null) {
                        log("================>>> FB Signed in: ${userCredential.user!.displayName}");
                      }
                    },
                    child: Container(
                      height: Get.height * 0.1,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          image: AssetImage("assets/social/facebook.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

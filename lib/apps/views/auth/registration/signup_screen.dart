import 'package:classified_apps/apps/core/utils/colors.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/views/auth/registration/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: AppColors.black,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: Get.size.height * 0.02)),

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
                            path: controller.loginController.settingModel.value!
                                        .data.logoImage !=
                                    ''
                                ? "${RemoteUrls.rootUrl}${controller.loginController.settingModel.value!.data.logoImage}"
                                : null,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 22,
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
                    const Text('Name'),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: controller.nameCtl,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: "Enter your name",
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Username'),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: controller.userNameCtrl,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: "Enter your username",
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Email'),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: controller.emailCtl,
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
                        obscureText: controller.obscureText.value,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
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
                    }),
                    const SizedBox(height: 16),
                    const Text('Confirm password'),
                    const SizedBox(height: 5),
                    Obx(() {
                      return TextFormField(
                        controller: controller.confPasswordCtl,
                        obscureText: controller.obscureConfirmText.value,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "Enter your confirm password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.toggleConfirm();
                            },
                            child: controller.obscureConfirmText.value
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black87,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Colors.black87,
                                  ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            ///Register BTN
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Obx(
                  () => SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        elevation: 5,
                        shadowColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        controller.userRegistration();
                      },
                      child: Center(
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Already have an account?"),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'login',
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
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      );
    });
  }
}

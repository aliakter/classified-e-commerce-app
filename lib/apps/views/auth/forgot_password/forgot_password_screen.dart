import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/core/utils/k_images.dart';
import 'package:classified_apps/apps/views/auth/forgot_password/controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/remote_urls.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ForgotPasswordController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xffF5F6FD),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Color(0xffFFEFE7)],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 6,
                                offset: const Offset(1, 1)),
                          ],
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CustomImage(
                                  path: controller.loginController.settingModel
                                      .value!.data.logoImage !=
                                      ''
                                      ? "${RemoteUrls.rootUrl}${controller.loginController.settingModel.value!.data.logoImage}"
                                      : null,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text('Forgot password',
                                  style: GoogleFonts.poppins(
                                      height: 1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Would you like to reset your password? Please enter the email address',
                                  style: GoogleFonts.poppins(
                                      height: 1.5,
                                      fontSize: 16,
                                      color: Colors.black54),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                children: [
                                  Text(
                                    "Email",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.emailController,
                              decoration: const InputDecoration(
                                  hintText: 'Enter your email'),
                            ),
                            const SizedBox(height: 28),
                            SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                style: OutlinedButton.styleFrom(
                                  elevation: 5,
                                  shadowColor: Colors.grey.shade300,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {
                                  controller.forgotPassWord();
                                },
                                child: Obx(
                                      () => controller.isLoading.value
                                      ? const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.white))
                                      : const Text("Request Reset Link"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

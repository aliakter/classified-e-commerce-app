import 'dart:io';
import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/profile_update/controller/profile_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BasicInfoEdit extends StatelessWidget {
  const BasicInfoEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileUpdateController controller = Get.find();

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.transparent),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 5))
            ]),
        child: Form(
          // key: bloc.formKey,
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Account information",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  )),
              SizedBox(
                height: 140,
                width: 140,
                child: Stack(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white,
                              width: 4,
                              strokeAlign: BorderSide.strokeAlignOutside),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 16,
                                offset: const Offset(0, 0)),
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 16,
                                offset: const Offset(0, 0)),
                          ]),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Obx(() => controller.image.value == ''
                              ? Material(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(100),
                                    hoverColor: Colors.white70,
                                    onTap: () {
                                      controller.chooseImage();
                                    },
                                    child: Obx(
                                      () => controller.userProfileModel.value!
                                                  .image !=
                                              ''
                                          ? Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CustomImage(
                                                    path: controller
                                                        .userProfileModel
                                                        .value!
                                                        .image),
                                                const FaIcon(
                                                  FontAwesomeIcons.camera,
                                                  size: 27,
                                                  color: Colors.black54,
                                                ),
                                              ],
                                            )
                                          : const Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FaIcon(
                                                      FontAwesomeIcons.image),
                                                  Text("Choose Profile")
                                                ],
                                              ),
                                            ),
                                    ),
                                  ),
                                )
                              : Image(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(controller.image.value),
                                  ),
                                ))),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 10,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 4)),
                          child: Material(
                            color: Colors.white,
                            shape: const CircleBorder(),
                            child: InkWell(
                                onTap: () {
                                  controller.chooseImage();
                                },
                                child: const Icon(Icons.camera_alt)),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 16,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Full name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  )),
              TextFormField(
                // controller: bloc.nameCtr,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  )),
              TextFormField(
                // controller: bloc.usernameCtr,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter username';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter your user name",
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  )),
              TextFormField(
                // controller: bloc.emailCtr,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required  Email*';
                  } else if (!Utils.isEmail(value)) {
                    return 'Enter valid email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Phone",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  )),
              TextFormField(
                // controller: bloc.phoneCtr,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter phone';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter your phone",
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Location",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  )),
              TextFormField(
                // controller: bloc.locationCtr,
                decoration: const InputDecoration(
                  hintText: "Enter your location",
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Website",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  )),
              TextFormField(
                // controller: bloc.webSiteCtr,
                decoration: const InputDecoration(
                  hintText: "Enter your location",
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: redColor,
                      shadowColor: ashColor,
                      side: const BorderSide(
                          width: 0.5,
                          color: redColor,
                          strokeAlign: BorderSide.strokeAlignInside),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  onPressed: () {
                    Utils.closeKeyBoard(context);
                    // bloc.updateAccInfo();
                  },
                  child: const Text(
                    "Save changes",
                    style:
                        TextStyle(color: redColor, fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

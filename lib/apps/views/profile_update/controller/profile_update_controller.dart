import 'dart:convert';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/profile_update/repository/profile_update_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../../../main.dart';
import '../../../core/utils/constants.dart';
import '../../../routes/routes.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../models/user_profile_models.dart';

class ProfileUpdateController extends GetxController {
  final ProfileUpdateRepository profileUpdateRepository;
  final DashboardController dashboardController;

  ProfileUpdateController(
      this.profileUpdateRepository, this.dashboardController);

  final TextEditingController nameCtr = TextEditingController();
  final TextEditingController userNameCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController phoneCtr = TextEditingController();
  final TextEditingController openingHour = TextEditingController();
  final TextEditingController closingHour = TextEditingController();
  final TextEditingController aboutCtr = TextEditingController();
  final TextEditingController webSiteCtr = TextEditingController();
  final TextEditingController currentPassCtr = TextEditingController();
  final TextEditingController newPassCtr = TextEditingController();
  final TextEditingController confirmPassCtr = TextEditingController();
  final TextEditingController deleteController = TextEditingController();
  Rxn<UserProfileModel> userProfileModel = Rxn<UserProfileModel>();
  RxBool isPasswordChangeLoading = false.obs;
  RxBool isAcDeleteLoading = false.obs;
  RxBool isLoading = false.obs;
  RxBool isUserLoading = false.obs;
  RxBool obscureText = true.obs;
  RxBool obscureNewText = true.obs;
  RxBool obscureConfirmText = true.obs;
  String token = "";
  var profileUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getToken();
    getUserProfile();
  }

  getToken() {
    token = sharedPreferences.getString("userToken") ?? "";
  }

  void toggle() {
    obscureText.toggle();
    update();
  }

  void toggleNew() {
    obscureNewText.toggle();
    update();
  }

  void toggleConfirm() {
    obscureConfirmText.toggle();
    update();
  }

  Future<void> getUserProfile() async {
    isUserLoading(true);
    final result = await profileUpdateRepository.getUserProfile(token);
    result.fold((error) {
      isUserLoading(false);
    }, (data) async {
      userProfileModel.value = data;
      profileUrl.value = userProfileModel.value!.image;
      nameCtr.text = userProfileModel.value!.name;
      userNameCtr.text = userProfileModel.value!.username;
      emailCtr.text = userProfileModel.value!.email;
      phoneCtr.text = userProfileModel.value!.phone;
      webSiteCtr.text = userProfileModel.value!.web;
      openingHour.text = userProfileModel.value!.openingHour;
      closingHour.text = userProfileModel.value!.closingHours;
      aboutCtr.text = userProfileModel.value!.aboutPublicProfile;
      isUserLoading(false);
    });
  }

  /// .......... time choose .....................
  TimeOfDay fromSelectedTime = TimeOfDay.now();

  openingSelectTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: fromSelectedTime,
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: redColor,
              onPrimary: Color(0xFF31A3DD),
              surface: Colors.white,
              onSurface: Color(0xFF000000),
            ),
            dialogBackgroundColor: Colors.blue[500],
          ),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      fromSelectedTime = newTime;
      openingHour
        ..text = newTime.format(context)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: openingHour.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
  }

  TimeOfDay toSelectedTime = TimeOfDay.now();

  closingSelectTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: toSelectedTime,
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: redColor,
              onPrimary: Color(0xFF31A3DD),
              surface: Colors.white,
              onSurface: Color(0xFF000000),
            ),
            dialogBackgroundColor: Colors.blue[500],
          ),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      toSelectedTime = newTime;
      closingHour
        ..text = newTime.format(context)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: closingHour.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
  }

  // ............ photo ...............
  String? originalImage;
  var image = ''.obs;
  String? base64Image = '';

  Future<void> chooseImage() async {
    await Utils.pickSingleImage().then((value) async {
      if (value != null) {
        originalImage = value;
        CroppedFile? file = await Utils.cropper(value, 1.0, 1.0);
        if (file != null) {
          image.value = file.path;
          List<int> imageBytes = await file.readAsBytes();
          base64Image =
          'data:image/${file.path.split('.').last};base64,${base64Encode(imageBytes)}';
        }
      }
    });
    update();
  }

  // bool isNameOkay() {
  //   if (nameCtr.text.isNotEmpty) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // bool isUserNameOkay() {
  //   if (userNameCtr.text.isNotEmpty) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // bool isEmailOkay() {
  //   if (emailCtr.text.isNotEmpty) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // bool isPhoneOkay() {
  //   if (phoneCtr.text.isNotEmpty) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // bool isWebOkay() {
  //   if (webSiteCtr.text.isNotEmpty) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // bool isOpenOurOkay() {
  //   if (openingHour.text.isNotEmpty) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // bool isClosOurOkay() {
  //   if (closingHour.text.isNotEmpty) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // bool isAboutPublicProfileOkay() {
  //   if (aboutCtr.text.isNotEmpty) {
  //     return true;
  //   }
  //   return false;
  // }

  Future<void> saveEditProfileData() async {
    Map<String, dynamic> body = {
      "name": nameCtr.text.trim(),
      "username": userNameCtr.text.trim(),
      "email": emailCtr.text.trim(),
      "phone": phoneCtr.text.trim(),
      "web": webSiteCtr.text.trim(),
      "image": base64Image ?? '',
      "opening_hour": openingHour.text.trim(),
      "closing_hours": closingHour.text.trim(),
      "about_public_profile": aboutCtr.text.trim(),
    };

    isLoading.value = true;
    final result = await profileUpdateRepository.editProfile(token, body);

    result.fold((error) {
      isLoading.value = false;
      Utils.toastMsg(error.message);
    }, (data) {
      getUserProfile();
      dashboardController.getDashboardData();
      Utils.toastMsg(data);
      isLoading.value = false;
    });
  }

  bool isCurrentPassOkay() {
    if (currentPassCtr.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool isNewPasswordOkay() {
    if (newPassCtr.text.isNotEmpty && newPassCtr.text.length > 2) return true;
    return false;
  }

  bool isConfirmPasswordOkay() {
    if (confirmPassCtr.text.isNotEmpty && confirmPassCtr.text.length > 2) {
      return true;
    }
    return false;
  }

  Future<void> changePassword() async {
    if (isCurrentPassOkay() && isNewPasswordOkay() && isConfirmPasswordOkay()) {
      if (newPassCtr.text == confirmPassCtr.text) {
        final body = {
          "current_password": currentPassCtr.text.trim(),
          "password": newPassCtr.text.trim(),
          "password_confirmation": confirmPassCtr.text.trim(),
        };

        isPasswordChangeLoading.value = true;
        final result =
            await profileUpdateRepository.changePassword(token, body);

        result.fold((error) {
          isPasswordChangeLoading.value = false;
          Utils.toastMsg(error.message);
        }, (data) {
          isPasswordChangeLoading.value = false;
          currentPassCtr.clear();
          newPassCtr.clear();
          confirmPassCtr.clear();
          Utils.toastMsg(data);
        });
      } else {
        Utils.toastMsg("Confirm password not matched");
      }
    } else if (!isCurrentPassOkay()) {
      Utils.toastMsg("Please enter your current password");
    } else if (!isNewPasswordOkay()) {
      Utils.toastMsg("Please enter your new password");
    } else if (!isConfirmPasswordOkay()) {
      Utils.toastMsg("Please enter your confirm password");
    }
  }

  ///Delete account
  Future<void> deleteAccount() async {
    isAcDeleteLoading.value = true;

    final result = await profileUpdateRepository.deleteAccount(token);
    result.fold((error) {
      isAcDeleteLoading.value = false;
      Utils.toastMsg(error.message);
    }, (data) {
      sharedPreferences.clear();
      Get.offAllNamed(Routes.login);
      Utils.toastMsg(data);
      isAcDeleteLoading.value = false;
    });
  }
}

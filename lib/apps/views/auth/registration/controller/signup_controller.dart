import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/main.dart';
import 'package:classified_apps/apps/views/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final AuthRepository authRepository;
  final LoginController loginController;

  SignUpController(this.authRepository, this.loginController);

  final TextEditingController nameCtl = TextEditingController();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController userNameCtrl = TextEditingController();
  final TextEditingController passwordCtl = TextEditingController();
  final TextEditingController confPasswordCtl = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool obscureConfirmText = true.obs;
  RxBool isLoading = false.obs;

  // UserLoginResponseModel? _user;
  // bool get isLoggedIn => _user != null && _user!.token.isNotEmpty;
  // UserLoginResponseModel? get userInfo => _user;
  // set user(UserLoginResponseModel userData) => _user = userData;
  // void cacheUserData() => authRepository.saveCashedUserInfo(_user!);
  // void cacheUserWithData(UserLoginResponseModel userData) =>
  //     authRepository.saveCashedUserInfo(userData);

  String token = "";
  String userId = "";
  String userFullName = "";
  String username = "";
  String userEmail = "";
  String userPhone = "";
  String userWebsite = "";
  String userImage = "";

  void toggle() {
    obscureText.toggle();
    update();
  }

  void toggleConfirm() {
    obscureConfirmText.toggle();
    update();
  }

  bool isNameOkay() {
    if (nameCtl.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool isUserNameOkay() {
    if (userNameCtrl.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool isEmailOkay() {
    if (emailCtl.text.isNotEmpty && GetUtils.isEmail(emailCtl.text)) {
      return true;
    }
    return false;
  }

  bool isPasswordOkay() {
    if (passwordCtl.text.isNotEmpty && passwordCtl.text.length > 2) return true;
    return false;
  }

  bool isConfirmPasswordOkay() {
    if (confPasswordCtl.text.isNotEmpty && confPasswordCtl.text.length > 2) {
      return true;
    }
    return false;
  }

  Future<void> userRegistration() async {
    if (isNameOkay() &&
        isUserNameOkay() &&
        isEmailOkay() &&
        isPasswordOkay() &&
        isConfirmPasswordOkay()) {
      if (passwordCtl.text == confPasswordCtl.text) {
        final body = <String, String>{};
        body.addAll({"name": nameCtl.text.trim()});
        body.addAll({"username": userNameCtrl.text.trim()});
        body.addAll({"email": emailCtl.text.trim()});
        body.addAll({"password": passwordCtl.text.trim()});
        body.addAll({"password_confirmation": confPasswordCtl.text.trim()});

        isLoading.value = true;
        final result = await authRepository.userRegister(body);

        result.fold((error) {
          isLoading.value = false;
          Utils.toastMsg(error.message);
        }, (data) async {
          sharedPreferences.setString("userToken", data.loginToken);
          sharedPreferences.setString("userId", data.user.id.toString() ?? "");
          sharedPreferences.setString(
              "userFullName", data.user.name.toString() ?? "");
          sharedPreferences.setString(
              "username", data.user.username.toString() ?? "");
          sharedPreferences.setString(
              "userEmail", data.user.email.toString() ?? "");
          sharedPreferences.setString(
              "userPhone", data.user.phone.toString() ?? "");
          sharedPreferences.setString(
              "userWebsite", data.user.website.toString() ?? "");
          sharedPreferences.setString(
              "userImage", data.user.image.toString() ?? "");

          token = sharedPreferences.getString("userToken") ?? "";
          userId = sharedPreferences.getString("userId") ?? "";
          userFullName = sharedPreferences.getString("userFullName") ?? "";
          username = sharedPreferences.getString("username") ?? "";
          userEmail = sharedPreferences.getString("userEmail") ?? "";
          userPhone = sharedPreferences.getString("userPhone") ?? "";
          userWebsite = sharedPreferences.getString("userWebsite") ?? "";
          userImage = sharedPreferences.getString("userImage") ?? "";
          nameCtl.text = "";
          userNameCtrl.text = "";
          emailCtl.text = "";
          passwordCtl.text = "";
          confPasswordCtl.text = "";
          isLoading.value = false;
          Get.offAllNamed(Routes.main);
        });
      } else {
        Utils.toastMsg("Confirm password not matched");
      }
    } else if (!isNameOkay()) {
      Utils.toastMsg("Please enter your name");
    } else if (!isUserNameOkay()) {
      Utils.toastMsg("Please enter your username");
    } else if (!isEmailOkay()) {
      Utils.toastMsg("Please enter your email");
    } else if (!isPasswordOkay()) {
      Utils.toastMsg("Please enter your password");
    } else if (!isConfirmPasswordOkay()) {
      Utils.toastMsg("Please enter your confirm password");
    }
  }
}

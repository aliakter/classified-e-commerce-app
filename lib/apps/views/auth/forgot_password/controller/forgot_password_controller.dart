import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/apps/views/auth/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{
  final AuthRepository authRepository;
  final LoginController loginController;

  ForgotPasswordController(this.authRepository, this.loginController);

  final emailController = TextEditingController();
  RxBool isLoading = false.obs;

  bool isEmailOkay() {
    if (emailController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void>forgotPassWord()async{
    if (isEmailOkay()) {
      final body = <String, String>{};
      body.addAll({"email": emailController.text.trim()});

      isLoading.value = true;
      final result = await authRepository.forgotPassWord(body);

      result.fold((error) {
        Utils.toastMsg(error.message);
        isLoading.value = false;
      }, (data) async {
        emailController.text = "";
        Get.back();
        Utils.toastMsg(data);
        isLoading.value = false;
      });
    } else {
      Utils.toastMsg("Please enter your email");
    }
  }
}
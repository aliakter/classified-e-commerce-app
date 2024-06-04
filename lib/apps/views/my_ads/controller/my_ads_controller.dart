import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/apps/views/my_ads/model/user_ads_model.dart';
import 'package:classified_apps/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repository/my_ads_repository.dart';

class MyAdsController extends GetxController/* with GetSingleTickerProviderStateMixin */{
  final LoginController loginController;
  final MyAdsRepository myAdsRepository;
  MyAdsController(this.loginController, this.myAdsRepository);

  RxBool isLoading = false.obs;
  RxBool isDeleteLoading = false.obs;
  String token = "";
  String userId = "";
  UserAdModel? userAdModel;

  @override
  void onInit() {
    super.onInit();
    getToken();
    getAdsData();
  }

  getToken(){
    token = sharedPreferences.getString("userToken")??"";
    userId = sharedPreferences.getString("userId")??"";
  }

  String capitalize(String input) {
    if (input == null || input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  void getAdsData() async {
    isLoading.value = true;
    final result = await myAdsRepository
        .getUserAdsData(token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      userAdModel = data;
      isLoading.value = false;
    });
  }

  deleteAds(String id) async {
    isDeleteLoading.value = true;
    final result = await myAdsRepository.deleteAds(
        token, id);
    result.fold((error) {
      Utils.toastMsg(error.message);
      isDeleteLoading.value = false;
    }, (data) async {
      Utils.toastMsg(data);
      getAdsData();
      Navigator.pop(Get.context!);
      isDeleteLoading.value = false;
    });
  }
}

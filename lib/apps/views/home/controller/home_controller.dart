import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/compare/controller/compare_controller.dart';
import 'package:classified_apps/apps/views/home/models/brand_model.dart';
import 'package:classified_apps/apps/views/home/models/category_model.dart';
import 'package:classified_apps/apps/views/home/models/home_model.dart';
import 'package:classified_apps/apps/views/home/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:classified_apps/apps/views/splash/languages/repository/language_repository.dart';
import '../../../../main.dart';
import '../../auth/login/model/setting_model.dart';
import '../../splash/languages/model/language_model.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;
  final LanguageRepository languageRepository;
  final CompareController compareController;

  HomeController(
      this.homeRepository, this.languageRepository, this.compareController);

  final scrollController2 = ScrollController();
  final searchController = TextEditingController();
  CarouselController carouselController = CarouselController();
  RxBool isLoading = false.obs;
  RxBool isNextTap = false.obs;
  RxBool isPreviousTap = false.obs;
  HomeModel? homeModel;

  String token = "";
  String userId = "";

  RxList<Category> categoryList = <Category>[].obs;
  List<BrandModel> brandList = [];
  var stateList = ["Dhaka", "Mymensingh"];
  RxBool isSettingLoading = false.obs;
  Rxn<SettingModel> settingModel = Rxn<SettingModel>();

  @override
  void onInit() {
    super.onInit();
    getToken();
    getHomeData();
    getLanguages();
    getSettingData();
  }

  getToken() {
    token = sharedPreferences.getString("userToken") ?? "";
    userId = sharedPreferences.getString("userId") ?? "";
  }

  void toTop() {
    scrollController2.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void onTapNextDown(TapDownDetails details) {
    isNextTap.value = true;
  }

  void onTapNextUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 50)).then((value) {
      isNextTap.value = false;
    });
  }

  void onTapPreviousDown(TapDownDetails details) {
    isPreviousTap.value = true;
  }

  void onTapPreviousUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 50)).then((value) {
      isPreviousTap.value = false;
    });
  }


  void getSettingData() async {
    isSettingLoading.value = true;
    final result = await homeRepository.getSettingData();
    result.fold((error) {
      isSettingLoading.value = false;
      print(error.message);
    }, (data) async {
      settingModel.value = data;
      isSettingLoading.value = false;
    });
  }

  Future<void> getHomeData() async {
    isLoading.value = true;
    final result = await homeRepository.getHomeData(token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      homeModel = data;
      categoryList.value = data.categories;
      brandList = data.brands;
      isLoading.value = false;
    });
  }

  // List compareList = [].obs;
  RxList<int> compareList = <int>[].obs;

  addToCompareList(int id) async {
    //add ad id to list
    compareList.add(id);

    // Convert the list to a JSON string
    final jsonString = json.encode(compareList);
    // Save the JSON string to SharedPreferences
    await sharedPreferences.setString('compareList', jsonString);
    compareController.getCompareListData();
    getHomeData();
  }

  bool checkIfCompareList(int id) {
    final jsonString = sharedPreferences.getString('compareList');
    if (jsonString != null) {
      List<dynamic> storedList = json.decode(jsonString);
      final items = List<int>.from(storedList);
      if (items.contains(id)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  void removedFromCompareList(int id) async {
    compareList.remove(id);
    // Convert the list to a JSON string
    final jsonString = json.encode(compareList);
    // Save the JSON string to SharedPreferences
    await sharedPreferences.setString('compareList', jsonString);
    compareController.getCompareListData();
    getHomeData();
    Get.find<HomeController>().compareList.refresh();
  }

  ///wishlist
  setUnsetWishlist(String id) async {
    final result = await homeRepository.setUnsetWishlist(token, id);
    result.fold((error) {
      Get.snackbar("Warning", error.message);
      print(error.message);
    }, (data) async {
      getHomeData();
      Utils.toastMsg(data);
    });
  }

  RxList<LanguageModel> languages = <LanguageModel>[].obs;

  Future<void> getLanguages() async {
    languageRepository.checkLanguage().fold((l) async {
      final result = await languageRepository.getLanguages();
      result.fold((error) {}, (data) {
        languages.value = data;
      });
    }, (r) async {
      if (r == false) {
        final result = await languageRepository.getLanguages();
        result.fold((error) {}, (data) {
          languages.value = data;
        });
      } else {
        final result = languageRepository.getCachedLanguages();
        result.fold((error) {}, (data) {
          languages.value = data;
        });
      }
    });
  }

  String getCountryName(code) {
    for (LanguageModel language in languages) {
      if (language.code == code) {
        print('asdfjh--------${language.name}');
        return language.name;
      }
    }
    update();
    return "English";
  }

  void toChange(String code) {
    print('aSDJKHAd ${code}');
    Locale(code);
    Get.updateLocale(Locale(code));
  }
}

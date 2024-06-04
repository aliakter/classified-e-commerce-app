import 'package:classified_apps/apps/views/ads/repository/ads_repository.dart';
import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/apps/views/home/controller/home_controller.dart';
import 'package:classified_apps/apps/views/home/models/ad_model.dart';
import 'package:classified_apps/apps/views/main/controller/main_controller.dart';
import 'package:classified_apps/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  final LoginController loginController;
  final AdRepository adsRepository;
  final HomeController homeController;

  AdsController(this.loginController, this.adsRepository, this.homeController);

  TextEditingController searchController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();

  var selectedCategory;
  final scrollController = ScrollController();
  final MainController mainController = MainController();
  RxString selectedCity = "".obs;
  RxString selectedSortingValue = "".obs;
  var stateList = ["Dhaka", "Mymensingh"];
  var categoryValue;
  String token = "";
  String userId = "";

  @override
  void onInit() {
    super.onInit();
    getToken();
    searchController.text = Get.arguments[0] ?? "";
    categoryValue = Get.arguments[1] ?? "";
    getAdsListData();
    scrollController.addListener(_init);
  }

  void _init() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMoreFiles();
    }
  }

  getToken() {
    token = sharedPreferences.getString("userToken") ?? "";
    userId = sharedPreferences.getString("userId") ?? "";
  }

  @override
  void onClose() {
    super.onClose();
    // searchAdsBloc.adList.clear();
  }

  RxBool isLoading = false.obs;
  List<AdsModel> adListMode = [];
  Future<void> getAdsListData() async {
    isLoading.value = true;
    final result = await adsRepository.getAdsListData(
      token,
      searchController.text ?? "",
      selectedCity.value ?? "",
      minPriceController.text ?? "",
      maxPriceController.text ?? "",
      selectedSortingValue.value ?? "",
      categoryValue ?? "",
      page.value.toString() ?? "",
    );
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) async {
      adListMode = data.adsList;
      isLoading.value = false;
    });
  }

  RxBool isPaging = true.obs;
  RxBool gettingMoreData = false.obs;
  RxInt page = 1.obs;

  loadMoreFiles() {
    if (isPaging.value) {
      page.value++;
      getAllBooksDataPage();
    }
  }

  void getAllBooksDataPage() async {
    gettingMoreData(true);

    final result = await adsRepository.getAdsListData(
      token,
      searchController.text ?? "",
      selectedCity.value ?? "",
      minPriceController.text ?? "",
      maxPriceController.text ?? "",
      selectedSortingValue.value ?? "",
      categoryValue ?? "",
      page.value.toString() ?? "",
    );
    result.fold((error) {
      gettingMoreData(false);
      print(error.message);
    }, (data) async {
      adListMode.addAll(data.adsList);
      gettingMoreData(false);
    });
  }
}

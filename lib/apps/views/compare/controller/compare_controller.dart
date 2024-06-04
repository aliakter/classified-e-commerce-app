import 'dart:convert';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/compare/model/compare_list_model.dart';
import 'package:classified_apps/apps/views/compare/repository/compare_repository.dart';
import 'package:classified_apps/apps/views/home/controller/home_controller.dart';
import 'package:classified_apps/main.dart';
import 'package:get/get.dart';

class CompareController extends GetxController {
  CompareRepository compareRepository;

  CompareController(this.compareRepository);

  RxBool isLoading = false.obs;
  List adsList = [];

  @override
  void onInit() {
    super.onInit();
    getCompareListData();
  }

  CompareListModel? compareListModel;

  void getCompareListData() async {
    isLoading.value = true;
    final jsonString = sharedPreferences.getString('compareList');
    final result = await compareRepository.getCompareList({
      "ads": jsonString ?? "",
    });
    result.fold((error) {
      isLoading.value = false;
    }, (data) {
      compareListModel = data;
      isLoading.value = false;
    });
  }

  Future<void> deleteAds(int id) async {
    final jsonString = sharedPreferences.getString('compareList');
    if (jsonString != null) {
      List<dynamic> storedList = json.decode(jsonString);
      final items = List<int>.from(storedList);
      items.remove(id);
      final jsonString1 = json.encode(items);
      await sharedPreferences.setString('compareList', jsonString1);
      Utils.toastMsg("Ad removed from compare list");
      getCompareListData();
      Get.find<HomeController>().getHomeData();
    }
  }
}

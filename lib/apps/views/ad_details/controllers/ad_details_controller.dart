import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/ad_details/model/ad_details_model.dart';
import 'package:classified_apps/apps/views/ads/repository/ads_repository.dart';
import 'package:classified_apps/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdDetailsController extends GetxController {
  final AdRepository adsRepository;

  AdDetailsController(this.adsRepository);

  Rx<String> slug = ''.obs;
  String reasonType = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String token = "";
  String userId = "";
  RxBool isLoadings = false.obs;
  RxBool isReportLoading = false.obs;
  Rxn<AdDetailsModel> adDetailsModel = Rxn<AdDetailsModel>();

  @override
  void onInit() {
    super.onInit();
    slug.value = Get.arguments;
    getToken();
    getAdDetails();
  }

  getToken() {
    token = sharedPreferences.getString("userToken") ?? "";
    userId = sharedPreferences.getString("userId") ?? "";
  }

  changeSlug(String val) {
    slug.value = val;
    getAdDetails();
    update();
  }

  Future<void> getAdDetails() async {
    print("ddddddddddddddddddddddddddddddddddddd");
    isLoadings.value = true;
    final result = await adsRepository.getAdDetails(token, slug.value);
    result.fold((error) {
      isLoadings.value = false;
    }, (data) async {
      adDetailsModel.value = data;
      isLoadings.value = false;
    });
  }

  isMe(int id) {
    if (int.parse(userId) == id) {
      return true;
    }
    return false;
  }

  bool isReasonTypeOkay() {
    if (reasonType.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool isEmailOkay() {
    if (emailController.text.isNotEmpty &&
        GetUtils.isEmail(emailController.text)) {
      return true;
    }
    return false;
  }

  bool isMessageOkay() {
    if (messageController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> checkValidationForAdReport({required String adId}) async {
    if (isReasonTypeOkay() && isEmailOkay() && isMessageOkay()) {
      Map<String, dynamic> body = {
        "ad_id": adId.toString(),
        "reason": reasonType,
        "email": emailController.text,
        "message": messageController.text
      };
      isReportLoading(true);
      final result = await adsRepository.postReport(token, body);
      result.fold((error) {
        isReportLoading(false);
        Utils.toastMsg(error.message);
        emailController.text = '';
        messageController.text = '';
        Navigator.pop(Get.context!);
      }, (data) async {
        isReportLoading(false);
        Utils.toastMsg(data);
        emailController.text = '';
        messageController.text = '';
        Navigator.pop(Get.context!);
      });
    } else if (!isReasonTypeOkay()) {
      Utils.toastMsg("Please select a reason type");
    } else if (!isEmailOkay()) {
      Utils.toastMsg("Please enter email address");
    } else if (!isMessageOkay()) {
      Utils.toastMsg("Please enter your message");
    }
  }
}

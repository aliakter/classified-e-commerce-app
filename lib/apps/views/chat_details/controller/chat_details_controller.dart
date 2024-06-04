import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/apps/views/chat_details/model/chat_details_model.dart';
import 'package:classified_apps/apps/views/chat_details/repository/chat_details_repository.dart';
import 'package:classified_apps/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatDetailsController extends GetxController {
  final LoginController loginController;
  final ChatDetailsRepository chatDetailsRepository;

  ChatDetailsController(this.chatDetailsRepository, this.loginController);

  String user = '';
  RxBool isLoading = false.obs;
  RxBool isLoadingSend = false.obs;
  Rxn<ChatDetailsModel> chatDetailsModel = Rxn<ChatDetailsModel>();
  final TextEditingController messageCtr = TextEditingController();
  String token = "";
  String userId = "";

  @override
  void onInit() {
    super.onInit();
    getToken();
    user = Get.arguments;
    getChatDetailsData();
  }

  getToken() {
    token = sharedPreferences.getString("userToken") ?? "";
    userId = sharedPreferences.getString("userId") ?? "";
  }

  void getChatDetailsData() async {
    isLoading.value = true;
    final result = await chatDetailsRepository.getChatDetails(token, user);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) {
      chatDetailsModel.value = data;
      isLoading.value = false;
    });
  }

  isMe(int id) {
    if (chatDetailsModel.value!.data.user.id == id) {
      return true;
    } else {
      return false;
    }
  }

  bool isMessageOkay() {
    if (messageCtr.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  void sendMessage() async {
    if (isMessageOkay()) {
      final body = <String, String>{};
      body.addAll({"body": messageCtr.text.trim()});

      isLoadingSend.value = true;
      final result = await chatDetailsRepository.sendMessage(token, user, body);

      result.fold(
        (error) {
          isLoadingSend.value = false;
          print(error.message);
        },
        (data) async {
          getChatDetailsData();
          messageCtr.clear();
          isLoadingSend.value = false;
        },
      );
    } else if (!isMessageOkay()){
      Utils.toastMsg("Type your message");
    }
  }
}

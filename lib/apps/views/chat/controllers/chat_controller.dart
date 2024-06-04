import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/apps/views/chat/model/chat_list_model.dart';
import 'package:classified_apps/apps/views/chat/repository/chat_repository.dart';
import 'package:classified_apps/main.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final LoginController loginController;
  final ChatRepository chatRepository;

  ChatController(this.loginController, this.chatRepository);
  ChatListModel? chatListModel;
  RxBool isLoading = false.obs;

  String token = "";
  String userId = "";

  @override
  void onInit() {
    super.onInit();
    getToken();
    getChatList();
  }

  getToken(){
    token = sharedPreferences.getString("userToken")??"";
    userId = sharedPreferences.getString("userId")??"";
  }
  void getChatList() async {
    isLoading.value = true;

    final result =
        await chatRepository.getChatList(token);
    result.fold((error) {
      isLoading.value = false;
      print(error.message);
    }, (data) {
      chatListModel = data;
      isLoading.value = false;
    });
  }
}

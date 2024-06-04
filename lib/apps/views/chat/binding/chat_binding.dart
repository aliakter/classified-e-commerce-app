import 'package:classified_apps/apps/views/chat/controllers/chat_controller.dart';
import 'package:classified_apps/apps/views/chat/repository/chat_repository.dart';
import 'package:get/get.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRepository>(() => ChatRepositoryImpl(Get.find()));
    Get.lazyPut(() => ChatController(Get.find(), Get.find()));
  }
}

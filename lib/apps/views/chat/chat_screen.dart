import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/core/utils/k_images.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:classified_apps/apps/views/chat/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/utils.dart';
import '../../data/remote_urls.dart';
import '../splash/localization/app_localizations.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('my_chats')!),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () => Future.delayed(
                    const Duration(seconds: 1), () => controller.getChatList()),
                child: controller.chatListModel!.data.users.isNotEmpty
                    ? CustomScrollView(
                        scrollDirection: Axis.vertical,
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount:
                                  controller.chatListModel!.data.users.length,
                              (context, index) {
                                return Material(
                                  color: Colors.white,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.chatDetails,
                                        arguments: controller.chatListModel!
                                            .data.users[index].username,
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 8),
                                          IntrinsicHeight(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: redColor,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: CustomImage(
                                                        path: controller
                                                                    .chatListModel!
                                                                    .data
                                                                    .users[
                                                                        index]
                                                                    .image !=
                                                                ''
                                                            ? '${RemoteUrls.rootUrl}${controller.chatListModel!.data.users[index].image}'
                                                            : null,
                                                        height: 50,
                                                        width: 50,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .chatListModel!
                                                            .data
                                                            .users[index]
                                                            .name,
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 16,
                                                          height: 1,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        controller
                                                            .chatListModel!
                                                            .data
                                                            .users[index]
                                                            .body,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 13,
                                                          height: 1,
                                                        ),
                                                      ),
                                                      Text(
                                                        Utils.timeAgo(controller
                                                            .chatListModel!
                                                            .data
                                                            .users[index]
                                                            .createdAt
                                                            .toString()),
                                                        style: const TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          const Divider(height: 1)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Image.asset(KImages.noDataImage),
                        ),
                      ),
              );
      }),
    );
  }
}

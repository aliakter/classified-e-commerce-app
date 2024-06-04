import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../splash/localization/app_localizations.dart';

class AdPostScreen extends GetView<AdPostController> {
  const AdPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdPostController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                child: Text(
                  AppLocalizations.of(context).translate('ad_post')!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: redColor,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator(color: redColor))
              : StreamBuilder(
                initialData: 0,
                stream: controller.naveListener.stream,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  int index = snapshot.data ?? 0;
                  return Column(
                    children: [
                      Expanded(
                        child: FadeTransition(
                          opacity: controller.animationController,
                          child: IndexedStack(
                            index: index,
                            children: controller.pageList,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: index == 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(1, 1),
                                )
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 45,
                                  child: Obx(
                                    () => ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      onPressed: () {
                                        Utils.closeKeyBoard(context);
                                        if (controller
                                            .featureFormKey.currentState!
                                            .validate()) {
                                          controller.postAds();
                                        }
                                      },
                                      child: controller
                                              .isPostAdsLoading.value
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(
                                                      color: Colors.white))
                                          : Text(
                                              index == 1
                                                  ? AppLocalizations.of(
                                                          context)
                                                      .translate('post_ad')!
                                                  : "Next Step",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
        ),
      );
    });
  }
}

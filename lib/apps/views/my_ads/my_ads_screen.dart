import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/k_images.dart';
import 'package:classified_apps/apps/views/my_ads/component/my_ads_card.dart';
import 'package:classified_apps/apps/views/my_ads/controller/my_ads_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../splash/localization/app_localizations.dart';

class MyAdsScreen extends GetView<MyAdsController> {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('my_ads')!),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: iconThemeColor,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.userAdModel!.data.data.isNotEmpty
                ? RefreshIndicator(
                    onRefresh: () async {
                      return controller.getAdsData();
                    },
                    child: CustomScrollView(
                      scrollDirection: Axis.vertical,
                      slivers: [
                        const SliverToBoxAdapter(child: SizedBox(height: 8)),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    controller.userAdModel!.data.data.length,
                                itemBuilder: (context, index) {
                                  return CustomerAdListCard(
                                    adModel: controller
                                        .userAdModel!.data.data[index],
                                    myAdsController: controller,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 50)),
                      ],
                    ),
                  )
                : SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Image.asset(KImages.noDataImage),
                    ),
                  ),
      ),
    );
  }
}

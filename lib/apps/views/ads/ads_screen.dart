import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/global_widget/custom_text_feild.dart';
import 'package:classified_apps/apps/views/ads/component/ads_appbar.dart';
import 'package:classified_apps/apps/views/ads/controller/ads_controller.dart';
import 'package:classified_apps/apps/views/home/component/grid_product_container2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../splash/localization/app_localizations.dart';

class AdsScreen extends GetView<AdsController> {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdsController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          // backgroundColor: const Color(0xFFF6F7FE),
          body: RefreshIndicator(
            onRefresh: () async {
              return controller.getAdsListData();
            },
            child: CustomScrollView(
              controller: controller.scrollController,
              scrollDirection: Axis.vertical,
              slivers: [
                MultiSliver(children: [
                  AdsAppBar.appBar(context, controller),

                  ///Search and Filtering area
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, top: 14, bottom: 14),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        color: Color(0XFFF7E7F3),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12, width: 8),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            ///Search text filed
                            Expanded(
                              flex: 2,
                              child: CustomTextField(
                                isObsecure: false,
                                controller: controller.searchController,
                                hintext: "What are you looking for?",
                                onChanged: (value) {},
                              ),
                            ),

                            Expanded(
                              child: SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  style: OutlinedButton.styleFrom(
                                    elevation: 5,
                                    shadowColor: Colors.grey.shade300,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {
                                    Utils.closeKeyBoard(context);
                                    controller.getAdsListData();
                                  },
                                  child: const Text(
                                    "Search",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Custom Price filtering
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: controller.minPriceController,
                                  height: 48,
                                  isObsecure: false,
                                  fillColor: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                  hintext:
                                      "${AppLocalizations.of(context).translate('min')}",
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: CustomTextField(
                                  controller: controller.maxPriceController,
                                  height: 48,
                                  isObsecure: false,
                                  fillColor: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                  hintext: AppLocalizations.of(context)
                                      .translate('max'),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: SizedBox(
                                  height: 48,
                                  child: ElevatedButton(
                                    style: OutlinedButton.styleFrom(
                                      elevation: 5,
                                      shadowColor: Colors.grey.shade300,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      Utils.closeKeyBoard(context);
                                      controller.getAdsListData();
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate('apply')!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          /// Filtering dropdown
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  AppLocalizations.of(context).translate('ads')!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(width: 50),
                              Obx(
                                () => Expanded(
                                  flex: 4,
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: const Text('Sort By',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        isDense: true,
                                        isExpanded: true,
                                        borderRadius: BorderRadius.circular(10),
                                        onChanged: (dynamic value) {
                                          controller.selectedSortingValue
                                              .value = value;
                                          controller.getAdsListData();
                                        },
                                        value: controller.selectedSortingValue
                                                    .value ==
                                                ""
                                            ? null
                                            : controller
                                                .selectedSortingValue.value,
                                        items:
                                            myItemSortListData.map((location) {
                                          return DropdownMenuItem<String>(
                                            value: location['value'],
                                            child: Text("${location['name']}"),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ),

                  Obx(
                    () => controller.isLoading.value
                        ? const SizedBox(
                            height: 400,
                            child: Center(child: CircularProgressIndicator()))
                        : SliverToBoxAdapter(
                            child: Column(
                              children: [
                                GridProductContainer2(
                                    onPressed: () {},
                                    adModelList: controller.adListMode),
                                Visibility(
                                  visible: controller.gettingMoreData.value,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: const Center(
                                      child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 50)),
                ])
              ],
            ),
          ),
        ),
      );
    });
  }
}

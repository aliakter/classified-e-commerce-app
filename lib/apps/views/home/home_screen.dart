import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/custom_image.dart';
import '../../global_widget/custom_text_feild.dart';
import '../splash/localization/app_localizations.dart';
import 'component/grid_product_container.dart';
import 'component/home_screen_shinner_widget.dart';
import 'component/list_product_card.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        scrolledUnderElevation: 0,
        title: Obx(
          () => controller.isSettingLoading.value
              ? Container()
              : Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CustomImage(
                      path: controller.settingModel.value!.data.logoImage != ''
                          ? "${RemoteUrls.rootUrl}${controller.settingModel.value!.data.logoImage}"
                          : null,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
        actions: [
          SizedBox(
            child: PopupMenuButton(
              icon: Material(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Text(controller.getCountryName(
                      AppLocalizations.of(context).languageCode)),
                ),
              ),
              itemBuilder: (context) => <PopupMenuEntry>[
                ...List.generate(controller.languages.length, (index) {
                  List<Flag> flags = [
                    Flag.fromCode(
                      FlagsCode.GB,
                      height: 20,
                      width: 20,
                    ),
                    Flag.fromCode(
                      FlagsCode.CN,
                      height: 20,
                      width: 20,
                    ),
                    Flag.fromCode(
                      FlagsCode.FR,
                      height: 20,
                      width: 20,
                    ),
                    Flag.fromCode(
                      FlagsCode.VU,
                      height: 20,
                      width: 20,
                    ),
                  ];
                  return PopupMenuItem(
                    onTap: () {
                      controller.toChange(controller.languages[index].code);
                    },
                    child: Row(
                      children: [
                        flags[index],
                        const SizedBox(
                          width: 16,
                        ),
                        Text(controller.languages[index].name),
                      ],
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const SingleChildScrollView(child: HomeScreenShimmerWidget())
            : RefreshIndicator(
                onRefresh: () => Future.delayed(
                    const Duration(seconds: 1), () => controller.getHomeData()),
                child: CustomScrollView(
                  controller: controller.scrollController2,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    /// SEARCH, FILTER FILED
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 14, right: 14, top: 14, bottom: 14),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                          color: Color(0XFFF7E7F3),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black12, width: 8),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              ///Search text filed
                              Expanded(
                                flex: 2,
                                child: CustomTextField(
                                  isObsecure: false,
                                  controller: controller.searchController,
                                  enabled: true,
                                  hintext: "What are you looking for?",
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
                                      if (controller.searchController.text !=
                                          "") {
                                        Get.toNamed(Routes.adsScreen,
                                                arguments: [
                                              controller
                                                      .searchController.text ??
                                                  "",
                                              ""
                                            ])!
                                            .then((value) {
                                          controller.searchController.text = "";
                                        });
                                      } else {
                                        Utils.toastMsg(
                                            "Input field is required");
                                      }
                                    },
                                    child: const Text(
                                      "Search",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///Category Section
                    SliverToBoxAdapter(
                      child: Visibility(
                        visible: true,
                        child: Column(
                          children: [
                            ///TITLE
                            Center(
                              child: Column(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: AppLocalizations.of(context)
                                          .translate('browse'),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18),
                                      children: <TextSpan>[
                                        const TextSpan(text: " "),
                                        TextSpan(
                                            text: AppLocalizations.of(context)
                                                .translate('categories'),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                                fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 70.0,
                                    margin: const EdgeInsets.fromLTRB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: const Column(
                                      children: [
                                        Divider(
                                          height: 1,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 40.0,
                                    child: Divider(
                                      height: 6,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 10)
                                ],
                              ),
                            ),

                            ///Category cards
                            Container(
                              alignment: Alignment.center,
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 0,
                                  childAspectRatio: 1.2,
                                ),
                                shrinkWrap: true,
                                itemCount:
                                    controller.homeModel?.categories.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.adsScreen, arguments: [
                                        "",
                                        controller.homeModel?.categories[index]
                                                .slug
                                                .toString() ??
                                            "",
                                      ])!
                                          .then((value) {
                                        controller.searchController.text = "";
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                                Colors.grey.shade300,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: CustomImage(
                                                path:
                                                    "${RemoteUrls.rootUrl}${controller.homeModel?.categories[index].image}",
                                                fit: BoxFit.cover,
                                                height: Get.height,
                                                width: Get.width,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Expanded(
                                            child: SizedBox(
                                              child: Text(
                                                "${controller.homeModel?.categories[index].name}",
                                                maxLines: 3,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///Feature section
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              text: AppLocalizations.of(context)
                                  .translate('featured'),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                              children: <TextSpan>[
                                const TextSpan(text: " "),
                                TextSpan(
                                    text: AppLocalizations.of(context)
                                        .translate('ads'),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                          Container(
                            width: 70.0,
                            margin:
                                const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                            child: const Column(
                              children: [
                                Divider(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 40.0,
                            child: Divider(
                              height: 6,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),

                    ///Feature AD SECTION
                    SliverPadding(
                      padding: const EdgeInsets.all(12),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 270,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.homeModel!.featureAds.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.adDetailsScreen,
                                      arguments:
                                          "${controller.homeModel?.featureAds[index].slug}");
                                },
                                child: ListProductCard(
                                  adsModel:
                                      controller.homeModel!.featureAds[index],
                                  logInUserId: controller.userId == ""
                                      ? 0
                                      : int.parse(controller.userId),
                                  index: index,
                                  width: 200,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                          ),
                        ),
                      ),
                    ),

                    ///LATEST AD SECTION
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),

                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: AppLocalizations.of(context)
                                  .translate('latest'),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                              children: <TextSpan>[
                                const TextSpan(text: " "),
                                TextSpan(
                                  text: AppLocalizations.of(context)
                                      .translate('ads'),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                            width: 70.0,
                            child:
                                const Divider(height: 1, color: Colors.black),
                          ),
                          const SizedBox(
                            width: 40.0,
                            child: Divider(height: 6, color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    ///Latest Ad Section
                    GridProductContainer(
                      adModelList: controller.homeModel?.latestAds ?? [],
                      title: "",
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  ],
                ),
              ),
      ),
    );
  }
}

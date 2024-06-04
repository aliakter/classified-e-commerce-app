import 'package:classified_apps/apps/routes/routes.dart';
import 'package:classified_apps/apps/views/main/controller/main_controller.dart';
import 'package:classified_apps/apps/views/profile/controllers/profile_controller.dart';
import 'package:classified_apps/apps/views/splash/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/custom_image.dart';
import '../../../data/remote_urls.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    ProfileController controller = Get.find();

    return controller.token == ""
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => controller.homeController.isSettingLoading.value
                      ? Container()
                      : Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CustomImage(
                              path: controller.homeController.settingModel
                                          .value!.data.logoImage !=
                                      ''
                                  ? "${RemoteUrls.rootUrl}${controller.homeController.settingModel.value!.data.logoImage}"
                                  : null,
                              height: 130,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 48,
                  width: 160,
                  child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      "Login Please",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      mainController.changePage(0);
                      Get.toNamed(Routes.login);
                    },
                  ),
                ),
              ],
            ),
          )
        : CustomScrollView(
            controller: controller.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Text(
                    "${AppLocalizations.of(context).translate('overview')}"),
                pinned: true,
              ),
              _buildProfileOptions(context, controller),
              const SliverToBoxAdapter(child: SizedBox(height: 65)),
            ],
          );
  }

  SliverPadding _buildProfileOptions(
      BuildContext context, ProfileController controller) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.dashBoard);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.home_outlined,
                size: 27,
                color: Colors.black54,
              ),
              title: Text(
                  "${AppLocalizations.of(context).translate('dashboard')}",
                  style: const TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.publicProfile,
                    arguments: controller.username);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.person_outline,
                size: 27,
                color: Colors.black54,
              ),
              title: Text(
                  "${AppLocalizations.of(context).translate("public_profile")}",
                  style: const TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.adPostScreen);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.add_circle_outline_rounded,
                size: 27,
                color: Colors.black54,
              ),
              title: Text(
                  "${AppLocalizations.of(context).translate("ad_post")}",
                  style: const TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.customerAds);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.format_list_bulleted,
                size: 27,
                color: Colors.black54,
              ),
              title: Text("${AppLocalizations.of(context).translate("my_ads")}",
                  style: const TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.compareAds);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.change_circle_outlined,
                size: 27,
                color: Colors.black54,
              ),
              title: Text(
                  "${AppLocalizations.of(context).translate("compare_ads")}",
                  style: const TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.favoriteAds);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.favorite_outline,
                size: 27,
                color: Colors.black54,
              ),
              title: Text(
                  "${AppLocalizations.of(context).translate("wishlist_ads")}",
                  style: const TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.chat);
                // Navigator.pushNamed(context, RouteNames.chatScreen);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.chat_sharp,
                size: 27,
                color: Colors.black54,
              ),
              title: Text("${AppLocalizations.of(context).translate("chats")}",
                  style: const TextStyle(fontSize: 16)),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(Routes.transaction);
              },
              leading: const Icon(
                Icons.article_outlined,
                color: Colors.black54,
              ),
              title: Text(
                "${AppLocalizations.of(context).translate("transections")}",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.userPlan);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.credit_card_outlined,
                color: Colors.black54,
              ),
              title:
                  const Text("Plans & Billing", style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () {
                Get.toNamed(Routes.pricePlaning);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.monetization_on_outlined,
                color: Colors.black54,
              ),
              title: const Text("Pricing", style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              onTap: () async {
                await launchUrl(
                  Uri.parse("https://safestore.tech/contact"),
                  webViewConfiguration: const WebViewConfiguration(
                    enableJavaScript: true,
                    enableDomStorage: true,
                  ),
                  mode: LaunchMode.externalApplication,
                );
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.contact_support_rounded,
                color: Colors.black54,
              ),
              title: Text(
                  "${AppLocalizations.of(context).translate("contact_us")}",
                  style: const TextStyle(fontSize: 16)),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(Routes.editProfile);
              },
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.settings_outlined,
                size: 27,
                color: Colors.black54,
              ),
              title: Text(
                  "${AppLocalizations.of(context).translate("settings")}",
                  style: const TextStyle(fontSize: 16)),
            ),
            ListTile(
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                Icons.exit_to_app_outlined,
                size: 27,
                color: Colors.black54,
              ),
              title: Text("${AppLocalizations.of(context).translate("logout")}",
                  style: const TextStyle(fontSize: 16)),
              onTap: () {
                controller.showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

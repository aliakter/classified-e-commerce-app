import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/views/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../splash/localization/app_localizations.dart';

class DashboardTopBar extends StatelessWidget {
  final DashboardController controller;

  const DashboardTopBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            color: redColor,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CustomImage(
              path: controller.dashboardModel?.data.user.image != ''
                  ? "${RemoteUrls.rootUrl}${controller.dashboardModel?.data.user.image}"
                  : null,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.dashboardModel?.data.user.name ?? "",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "${controller.dashboardModel?.data.adsCount.activeAdsCount} ${AppLocalizations.of(context).translate('active_posted_ads')!}",
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.white.withAlpha(910),
          elevation: 3,
          shadowColor: const Color(0xFFFFFFFF),
          borderOnForeground: true,
          shape: const CircleBorder(),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              Get.toNamed(Routes.editProfile);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.edit,
                color: redColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

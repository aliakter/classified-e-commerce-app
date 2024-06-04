import 'package:classified_apps/apps/views/dashboard/component/dashboard_grid_card_layout.dart';
import 'package:classified_apps/apps/views/dashboard/component/dashboard_topbar.dart';
import 'package:classified_apps/apps/views/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/component/horizontal_ad_container.dart';
import '../splash/localization/app_localizations.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Dashboard"),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: RefreshIndicator(
                  onRefresh: () => Future.delayed(const Duration(seconds: 1),
                      () => controller.getDashboardData()),
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        sliver: SliverToBoxAdapter(
                            child: DashboardTopBar(controller: controller)),
                      ),
                      const SliverPadding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        sliver: DashboardGridCardLayout(),
                      ),

                      ///.......... Recent Ads horizontal ..........
                      SliverToBoxAdapter(
                        child: HorizontalProductContainer(
                          adsModel: [],
                          title: AppLocalizations.of(context)
                              .translate('recent_ads')!,
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 30)),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

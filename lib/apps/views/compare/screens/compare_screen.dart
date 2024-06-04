import 'package:classified_apps/apps/views/compare/components/compare_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../splash/localization/app_localizations.dart';
import '../components/compare_list_container.dart';
import '../controller/compare_controller.dart';

class CompareScreen extends GetView<CompareController> {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CompareController controller = Get.find();

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          return controller.getCompareListData();
        },
        child: Obx(
          () => CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverAppBar(
                title: Text(
                    AppLocalizations.of(context).translate('compare_ads')!),
              ),
              controller.isLoading.value
                  ? SliverPadding(
                      padding: const EdgeInsets.all(12),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 250,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => const ShimmerCard(),
                        ),
                      ),
                    )
                  : const CompareListContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

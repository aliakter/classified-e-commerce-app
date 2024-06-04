import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/views/compare/components/compare_list_container.dart';
import 'package:classified_apps/apps/views/compare/controller/compare_controller.dart';
import 'package:classified_apps/apps/views/home/component/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../splash/localization/app_localizations.dart';

class ComparePage extends GetView<CompareController> {
  const ComparePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('compare_list')!),
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
        () => RefreshIndicator(
          onRefresh: () => Future.delayed(const Duration(seconds: 1),
              () => controller.getCompareListData()),
          child: controller.isLoading.value
              ? const ShimmerList()
              : const CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    CompareListContainer(),
                  ],
                ),
        ),
      ),
    );
  }
}

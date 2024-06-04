import 'package:classified_apps/apps/core/utils/k_images.dart';
import 'package:classified_apps/apps/views/compare/components/compare_product_card.dart';
import 'package:classified_apps/apps/views/compare/controller/compare_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CompareListContainer extends StatelessWidget {
  const CompareListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      sliver: MultiSliver(
        children: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              if (Get.find<CompareController>()
                  .compareListModel!
                  .data
                  .isNotEmpty) {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 250,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: Get.find<CompareController>()
                        .compareListModel!
                        .data
                        .length,
                    (BuildContext context, int pIndex) => CompareProductCard(
                      adModel: Get.find<CompareController>()
                          .compareListModel!
                          .data[pIndex],
                    ),
                  ),
                );
              } else {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Image.asset(KImages.noDataImage),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

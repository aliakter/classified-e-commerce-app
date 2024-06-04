import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:classified_apps/apps/views/home/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../splash/localization/app_localizations.dart';

class NewAdPostCategoryChooser extends GetView<AdPostController> {
  const NewAdPostCategoryChooser(this.onPressed, this.categoryList,
      {super.key});

  final List<Category> categoryList;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdPostController>(builder: (controller) {
      return CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                AppLocalizations.of(context).translate('select_a_category')!,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(color: redColor))
                : SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: categoryList.length,
                        (context, index) {
                          var category = categoryList[index];
                          return Column(
                            children: [
                              Material(
                                color: redColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(6),
                                child: InkWell(
                                  onTap: () {
                                    // print("asdkjhf ${category.id}");
                                    controller.getSubcategory(category.id);
                                    controller.selectedCategory =
                                        category.id.toString();
                                    Future.delayed(
                                            const Duration(milliseconds: 200))
                                        .then((value2) {
                                      onPressed();
                                    });
                                  },
                                  splashColor: redColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(6),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Text(
                                              category.name,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        const Icon(Icons.arrow_forward)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      );
    });
  }
}

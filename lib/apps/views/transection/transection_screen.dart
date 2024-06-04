import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/k_images.dart';
import 'package:classified_apps/apps/views/transection/component/my_plan_card.dart';
import 'package:classified_apps/apps/views/transection/controller/transection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Transactions"),
            scrolledUnderElevation: 0,
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
                : controller.transactionModel!.isNotEmpty
                    ? RefreshIndicator(
                        onRefresh: () async {
                          return controller.getTransaction();
                        },
                        child: CustomScrollView(
                          slivers: [
                            SliverPadding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  childCount:
                                      controller.transactionModel!.length,
                                  (context, index) {
                                    return MyPlanCard(
                                      transactionController: controller,
                                      transactionModel:
                                          controller.transactionModel![index],
                                    );
                                  },
                                ),
                              ),
                            )
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
      },
    );
  }
}

import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/views/user_plan/controller/user_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPlanScreen extends GetView<UserPlanController> {
  const UserPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plans & Billing"),
        backgroundColor: redColor,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: redColor,
                      blurRadius: 4,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Plan Benefits",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xffe8f7ff),
                          child: Icon(
                            Icons.check,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            const Text(
                              "Ads Remaining ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Text("${controller.planModel?.plan.adLimit}",
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xffe8f7ff),
                          child: Icon(
                            Icons.check,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            const Text(
                              "Business Directory Remaning",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "${controller.planModel?.plan.businessDirectoryLimit}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xffe8f7ff),
                          child: Icon(
                            Icons.check,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            const Text(
                              "Events Remaining ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Text(
                              "${controller.planModel?.plan.eventLimit}",
                              style: const TextStyle(
                                color: Colors.red,
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xffe8f7ff),
                          child: Icon(
                            Icons.check,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            const Text(
                              "Featured Ads Remaining",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "${controller.planModel?.plan.featuredLimit}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
      }),
    );
  }
}

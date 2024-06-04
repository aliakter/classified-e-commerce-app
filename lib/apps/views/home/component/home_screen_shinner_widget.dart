import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenShimmerWidget extends StatelessWidget {
  const HomeScreenShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: Get.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 40,
                    width: Get.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                  )
                ],
              )),
        ),
        SizedBox(
          // width: Get.width,
          // height: 30.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade300,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.6,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///category

                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 80.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 30.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: Get.width * 0.7,
                      height: 30.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

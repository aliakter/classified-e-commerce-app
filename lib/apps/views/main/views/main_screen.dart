import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';
import '../widgets/my_bottom_navbar.dart';

class MainScreen extends GetView<MainController> {
  MainScreen({Key? key}) : super(key: key);

  // final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: () => controller.onBackPressed(context),
          child: Scaffold(
            // key: scaffoldKey,
            // backgroundColor:
            // body: PageView(
            //   controller: controller.pageController,
            //   scrollDirection: Axis.horizontal,
            //   physics: const NeverScrollableScrollPhysics(),
            //   children: controller.screenList,
            // ),
            body: controller.screenList[controller.pageIndex],
            bottomNavigationBar: MyBottomNavigationBar(
              controller: controller
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../compare/screens/compare_screen.dart';
import '../../home/home_screen.dart';
import '../../profile/screens/profile_screen.dart';

class MainController extends GetxController {
  int pageIndex = 0;
  // PageController pageController= PageController();

  @override
  void onInit() {
    // print("ammaianan");
    // pageController = PageController(
    //   initialPage: pageIndex,
    // );
    pageIndex = 0;
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // pageController.dispose();
    // TODO: implement onClose
    super.onClose();
  }

  void changePage(int index) {
    pageIndex = index;
    update();
  }

  List<Widget> screenList = [
    const HomeScreen(),
    const CompareScreen(),
    const ProfileScreen(),
  ];

  Future<bool> onBackPressed(context) async {
    if (pageIndex != 0) {
      changePage(0);
      // pageController.jumpToPage(0);
      return false;
    } else {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              title: const Text(
                'Are you sure you want to close application?',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(
                        // color:
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      // color:
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )) ??
          false;
    }
  }
}

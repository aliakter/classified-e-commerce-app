import 'package:classified_apps/apps/views/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';
import '../../splash/localization/app_localizations.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key, required this.controller});

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      // fixedColor:
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(fontSize: 14, color: redColor),
      unselectedLabelStyle:
          const TextStyle(fontSize: 14, color: Color(0xff85959E)),
      elevation: 0,
      onTap: (index) {
        controller.changePage(index);
        // controller.pageController.animateToPage(
        //   index,
        //   duration: const Duration(milliseconds: 500),
        //   curve: Curves.ease,
        // );
      },
      currentIndex: controller.pageIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined, color: paragraphColor),
          activeIcon: const Icon(Icons.home, color: redColor),
          label: AppLocalizations.of(context).translate('home'),
        ),
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.change_circle, color: redColor),
          icon: const Icon(Icons.change_circle_outlined, color: paragraphColor),
          label: AppLocalizations.of(context).translate('compare_ads'),
        ),
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.person, color: redColor),
          icon: const Icon(Icons.person_outline, color: paragraphColor),
          label: AppLocalizations.of(context).translate('profile'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/custom_image.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final _className = '_SplashScreenState';
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() {
      if (mounted) setState(() {});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(Get.find(), Get.find()),
        builder: (controller) {
          return Scaffold(
            body: AnimationWidget(animation: animation),
          );
        });
  }
}

class AnimationWidget extends StatelessWidget {
  const AnimationWidget({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [whiteColor, whiteColor],
            ),
          ),
          child: const SizedBox(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomImage(
              path: "assets/images/logo_image.png",
              width: animation.value * 200,
              height: animation.value * 200,
            ),
            const SizedBox(height: 50),
            const Center(
                child: CircularProgressIndicator(color: redColor)),
          ],
        ),
      ],
    );
  }
}

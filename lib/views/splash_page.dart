import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/splash_controller.dart';
import 'package:lachule/widgets/back_ground.dart';

class SplashPage extends GetWidget<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: <Widget>[
            const BackGround(),
            _splashBg(),
            _splashLogo(),
          ],
        ),
      ),
    );
  }

  Widget _splashLogo() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(ImageAssets.logo),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'คุณภาพ คู่ คุณธรรม',
              style: TextStyle(
                fontSize: BaseSizes.fontH4,
                color: BaseColors.primaryRed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _splashBg() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            ImageAssets.splashBg,
            fit: BoxFit.fitHeight,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

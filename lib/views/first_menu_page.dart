import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/first_menu_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/divider_with_text.dart';
import 'package:lachule/widgets/button/outline_button.dart';
import 'package:lachule/widgets/button/primary_button.dart';

class FirstMenuPage extends GetWidget<FirstMenuController> {
  const FirstMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return GestureDetector(
      child: Obx(
        () => Scaffold(
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: <Widget>[
                _animatedBg(),
                _animatedLogo(context),
                _bottomSheet(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textLogo() {
    return AnimatedOpacity(
      opacity: FirstMenuController.state.value ? 1.0 : 0.0,
      duration: const Duration(seconds: 1),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'คุณภาพ คู่ คุณธรรม',
          style: TextStyle(
            fontSize: BaseSizes.fontH4,
            color: BaseColors.primaryRed,
          ),
        ),
      ),
    );
  }

  Widget _animatedLogo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 168, 0, 168),
      child: AnimatedAlign(
        alignment: FirstMenuController.state.value
            ? Alignment.center
            : Alignment.topCenter,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Image.asset(ImageAssets.logo),
            _textLogo(),
          ],
        ),
      ),
    );
  }

  Widget _animatedBg() {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: FirstMenuController.state.value ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          child: Center(
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
          ),
        ),
        AnimatedOpacity(
          opacity: FirstMenuController.state.value ? 0.0 : 1.0,
          duration: const Duration(seconds: 1),
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Image.asset(
              ImageAssets.firstMenuBg,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _toRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: OutlinedButtonView(
          onPressed: () => {},
          title: 'สมัครสมาชิกใหม่',
          textStyle: const TextStyle(
            fontSize: BaseSizes.fontH4,
            color: BaseColors.primaryRed,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _skipButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: OutlinedButtonView(
          onPressed: () => Get.toNamed(AppRoutes.LOGIN),
          title: 'ข้าม',
          textStyle: const TextStyle(
            fontSize: BaseSizes.fontH4,
            color: BaseColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
          borderColor: BaseColors.btnDisabledPlaceholder,
        ),
      ),
    );
  }

  Widget _toLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: PrimaryButtonView(
          onPressed: () => {Get.toNamed(AppRoutes.LOGIN)},
          title: 'เข้าสู่ระบบ',
          textStyle: const TextStyle(
            fontSize: BaseSizes.fontH4,
            color: BaseColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _bottomSheet() {
    return AnimatedOpacity(
      opacity: FirstMenuController.state.value ? 0 : 1,
      duration: const Duration(seconds: 1),
      child: Column(children: <Widget>[
        const Expanded(
          flex: 1,
          child: SizedBox.shrink(),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: SafeArea(
              top: false,
              child: Column(
                children: <Widget>[
                  _toLoginButton(),
                  const DividerWithText(
                    title: 'หากยังไม่มีบัญชี โปรดกดสมัครใหม่',
                  ),
                  _toRegisterButton(),
                  _skipButton(),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/login_controller.dart';
import 'package:lachule/widgets/back_ground.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';
import 'package:lachule/widgets/text_field/app_text_field.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: <Widget>[
              const BackGround(
                color: BaseColors.bgPrimary,
              ),
              _loginBg(),
              const GoBackbutton(),
              _bottomSheet(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginBg() {
    return SizedBox(
      width: Get.width,
      child: Image.asset(
        ImageAssets.loginBg,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _bottomSheet() {
    return DismissibleKeyboard(
      child: Column(
        children: [
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
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: SafeArea(
                top: false,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: BaseSizes.fontH1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    AppTextField(
                      controller.usernameController,
                      labelText: 'หมายเลขสมาชิก',
                      prefixIcon: Image.asset(IconAssets.person),
                    ),
                    AppTextField(
                      controller.passwordController,
                      labelText: 'หมายเลขสมาชิก',
                      prefixIcon: Image.asset(IconAssets.lock),
                      canObscure: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

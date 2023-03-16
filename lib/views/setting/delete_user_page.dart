import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/setting/delete_user_controller.dart';
import 'package:lachule/widgets/app_main_body.dart';
import 'package:lachule/widgets/button/primary_button.dart';

class DeleteUserPage extends GetView<DeleteUserController> {
  const DeleteUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return AppMainBody(
      title: 'ลบบัญชีผู้ใช้งาน',
      bottomNavigationBar: _bottomNavBar(),
      child: Column(
        children: [
          Text(
            controller.deleteUserText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: BaseSizes.fontBody1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavBar() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(22),
        width: double.infinity,
        child: PrimaryButtonView(
          onPressed: () => {
            controller.onPressedDelete(),
          },
          prefixIcon: Image.asset(
            IconAssets.trashRed,
            color: BaseColors.white,
            width: 24,
            fit: BoxFit.fitWidth,
          ),
          title: 'ลบบัญชีผู้ใช้',
          textStyle: const TextStyle(
            color: BaseColors.white,
            fontSize: BaseSizes.fontH4,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/detail_privilege_controller.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:lachule/widgets/button/primary_button.dart';

class DetailPrivilegePage extends GetView<DetailPrivilegeController> {
  const DetailPrivilegePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _imageBg(),
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _vipCargImage(),
                    _bottomSheet(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _imageBg() {
    return Image.asset(
      ImageAssets.splashBg,
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }

  AppBar _appbar() {
    return AppBar(
      leading: const GoBackbutton(),
      leadingWidth: 36,
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'สิทธิ์ประโชยน์',
            style: TextStyle(
              color: BaseColors.textPrimary,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _vipCargImage() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      alignment: Alignment.center,
      child: Image.asset(
        ImageAssets.vipCard,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: BaseColors.white),
      child: Text(
        controller.detail,
        style: const TextStyle(
          color: BaseColors.textPrimary,
          fontSize: BaseSizes.fontBody1,
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: BaseColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              spreadRadius: 8,
              blurRadius: 7,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: PrimaryButtonView(
                onPressed: () => {},
                title: 'สมัครสมาชิก',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

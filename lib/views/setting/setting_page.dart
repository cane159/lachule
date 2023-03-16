import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/setting/setting_controlelr.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/app_main_body.dart';
import 'package:lachule/widgets/button/outline_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(() => AppMainBody(
          isGoBack: false,
          title: 'ตั้งค่า',
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  border: Border.all(color: BaseColors.borderColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    _settingButtom(
                      'แก้ไขข้อมูลส่วนตัว',
                      () => {Get.toNamed(AppRoutes.PERSONALINFORMATIONSETTING)},
                    ),
                    _settingButtom(
                      'การแจ้งเตือน',
                      () => {Get.toNamed(AppRoutes.NOTISETTING)},
                    ),
                    _settingButtom(
                      'ภาษา',
                      () => {Get.toNamed(AppRoutes.LANGUAGESETTING)},
                    ),
                    _settingButtom(
                      'ข้อตกลง และเงื่อนไขการให้บริการ',
                      () => {},
                    ),
                    _settingButtom(
                      'นโยบาย (PDPA)',
                      () => {},
                    ),
                    _settingButtom(
                      'ลบบัญชีผู้ใช้งาน',
                      () => {Get.toNamed(AppRoutes.DELETEUSER)},
                    ),
                    _appVersion(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 70),
                width: double.infinity,
                child: OutlinedButtonView(
                  onPressed: () => {},
                  title: 'ออกจากระบบ',
                  borderColor: BaseColors.btnDisabledPlaceholder,
                  textStyle: const TextStyle(
                    fontSize: BaseSizes.fontH4,
                    color: BaseColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _imageBg() {
    return Image.asset(
      ImageAssets.splashBg,
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }

  Widget _appVersion() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'เวอร์ชันแอพพลิเคชั่น',
            style: TextStyle(
              color: BaseColors.textPrimary,
              fontSize: BaseSizes.fontH4,
            ),
          ),
          Text(
            controller.appVersion,
            style: const TextStyle(
              color: BaseColors.textPrimary,
              fontSize: BaseSizes.fontH4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingButtom(String label, VoidCallback onPressed) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: BaseColors.borderColor,
          ),
        ),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          side: BorderSide.none,
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: BaseColors.textPrimary,
                fontSize: BaseSizes.fontH4,
              ),
            ),
            Image.asset(
              IconAssets.arrowRight,
              width: 18,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}

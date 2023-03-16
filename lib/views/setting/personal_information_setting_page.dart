import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/setting/personal_information_setting_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/app_main_body.dart';

class PersonalInformationSettingPage
    extends GetView<PersonalInformationSettingController> {
  const PersonalInformationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return AppMainBody(
      title: 'แก้ไขข้อมูลส่วนตัว',
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
                  'ข้อมูลผู้สมัคร',
                  () => {
                    Get.toNamed(
                      AppRoutes.USERSETTING,
                      arguments: 'setting',
                    )
                  },
                ),
                _settingButtom(
                  'ข้อมูลการรับผลประโยชน์',
                  () => {Get.toNamed(AppRoutes.BENEFITSETTING)},
                ),
                _settingButtom(
                  'ที่อยู่ในการจัดส่ง',
                  () => {
                    Get.toNamed(
                      AppRoutes.ADDRESSSETTING,
                      arguments: 'setting',
                    ),
                  },
                  isBottom: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingButtom(String label, VoidCallback onPressed,
      {bool isBottom = false}) {
    return Container(
      decoration: BoxDecoration(
        border: isBottom
            ? null
            : const Border(
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

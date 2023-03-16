import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/setting/delete_user_controller.dart';
import 'package:lachule/controllers/setting/noti_setting_controller.dart';
import 'package:lachule/widgets/app_main_body.dart';
import 'package:lachule/widgets/button/primary_button.dart';

class NotiSettingPage extends GetView<NotiSettingController> {
  const NotiSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => AppMainBody(
        title: 'ลบบัญชีผู้ใช้งาน',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'เปิด / ปิดการแจ้งเตือน',
                        style: TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontH4,
                        ),
                      ),
                      Switch.adaptive(
                        value: controller.isNoti,
                        onChanged: (value) => {
                          controller.onPressedSwitch(value),
                        },
                        activeTrackColor: BaseColors.actived,
                        activeColor: BaseColors.actived,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

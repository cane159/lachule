import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/setting/language_setting_controller.dart';
import 'package:lachule/widgets/app_main_body.dart';

class LanguageSettingPage extends GetView<LanguageSettingController> {
  const LanguageSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => AppMainBody(
        title: 'ภาษา',
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
                        'ภาษา',
                        style: TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontH4,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => {
                              controller.pressedThai(),
                            },
                            style: TextButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              alignment: Alignment.center,
                              minimumSize: const Size(0, 30),
                            ),
                            child: Text(
                              'ไทย',
                              style: TextStyle(
                                color: controller.isThai
                                    ? BaseColors.textPrimary
                                    : BaseColors.btnDisabledPlaceholder,
                                fontSize: BaseSizes.fontH4,
                              ),
                            ),
                          ),
                          const Text(
                            ' | ',
                            style: TextStyle(
                              color: BaseColors.textPrimary,
                              fontSize: BaseSizes.fontH4,
                            ),
                          ),
                          TextButton(
                            onPressed: () => {
                              controller.pressedEnglish(),
                            },
                            style: TextButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              alignment: Alignment.center,
                              minimumSize: const Size(70, 30),
                            ),
                            child: Text(
                              'English',
                              style: TextStyle(
                                color: controller.isThai
                                    ? BaseColors.btnDisabledPlaceholder
                                    : BaseColors.textPrimary,
                                fontSize: BaseSizes.fontH4,
                              ),
                            ),
                          ),
                        ],
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/setting/benefit_setting_controller.dart';
import 'package:lachule/widgets/app_main_body.dart';

class BenefitSettingPage extends GetView<BenefitSettingController> {
  const BenefitSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return AppMainBody(
      title: 'ข้อมูลการรับผลประโยชน์',
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
                _contentBody(
                  'ธนาคาร',
                  controller.benefit.bankName,
                ),
                _contentBody(
                  'สาขา',
                  controller.benefit.bankBranch,
                ),
                _contentBody(
                  'ประเภทบัญชี',
                  controller.benefit.bookBankType,
                ),
                _contentBody(
                  'เลขบัญชี',
                  controller.benefit.bookBankNumber,
                ),
                _contentBody(
                  'ชื่อบัญชี',
                  controller.benefit.bookBankName,
                  isBottom: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _contentBody(
    String label,
    String title, {
    bool? isBottom = false,
  }) {
    return Container(
      decoration: isBottom == false
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: BaseColors.borderColor,
                ),
              ),
            )
          : null,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: BaseColors.textContent,
              fontSize: BaseSizes.fontH4,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: BaseColors.textPrimary,
              fontSize: BaseSizes.fontH4,
            ),
          ),
        ],
      ),
    );
  }
}

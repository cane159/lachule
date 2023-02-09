import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/register/register_page_view_controller.dart';
import 'package:lachule/widgets/bottom_sheet_select_menu.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';
import 'package:lachule/widgets/register_app_scaffold.dart';
import 'package:lachule/widgets/text_field/app_text_field.dart';

class BenefitInformationPage extends GetView<RegisterPageViewController> {
  BenefitInformationPage({super.key, required this.pageViewController});

  final PageController pageViewController;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => DismissibleKeyboard(
        child: RegisterAppScaffold(
          onGoBack: () => controller.onTapped(1, pageViewController),
          initialPage: 3,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      IconAssets.walleTadd1,
                      width: 20,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text(
                      'ข้อมูลการรับผลประโยชน์',
                      style: TextStyle(
                        color: BaseColors.textPrimary,
                        fontSize: BaseSizes.fontH4,
                      ),
                    )
                  ],
                ),
                BottomSheetSelectMenu(
                  title: 'เลือกธนาคาร',
                  label: 'ธนาคาร *',
                  onPressed: (value) => controller.onSelectBottomSheet(
                      value, controller.userBank),
                  listObject: controller.bankList,
                  initialValue: controller.userBank.value,
                ),
                AppTextField(
                  controller.userBankBranch,
                  labelText: 'สาขา *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                BottomSheetSelectMenu(
                  title: 'เลือกประเภทบัญชี',
                  label: 'ประเภทบัญชี *',
                  onPressed: (value) => controller.onSelectBottomSheet(
                      value, controller.userBankAccountType),
                  listObject: controller.bankAccountTypeList,
                  initialValue: controller.userBankAccountType.value,
                ),
                AppTextField(
                  controller.userBankAccountNumber,
                  labelText: 'เลขบัญชี *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                AppTextField(
                  controller.userBankAccountName,
                  labelText: 'ชื่อบัญชี *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: PrimaryButtonView(
                    onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {controller.onTapped(3, pageViewController)}
                    },
                    title: 'ถัดไป',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

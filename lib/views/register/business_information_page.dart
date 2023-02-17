import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/register/register_page_view_controller.dart';
import 'package:lachule/widgets/app_check_box.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';
import 'package:lachule/widgets/register_app_scaffold.dart';
import 'package:lachule/widgets/text_field/app_text_field.dart';

class BusinessInformationPage extends GetView<RegisterPageViewController> {
  BusinessInformationPage({super.key, required this.pageViewController});

  final PageController pageViewController;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => DismissibleKeyboard(
        child: RegisterAppScaffold(
          initialPage: 1,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      IconAssets.briefCase,
                      width: 20,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text(
                      'ข้อมูลธุรกิจ',
                      style: TextStyle(
                        color: BaseColors.textPrimary,
                        fontSize: BaseSizes.fontH4,
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 12, 0),
                      child: AppCheckBox(
                        value: controller.isReferralCode.value,
                        onChanged: (value) =>
                            controller.pressReferralCode(value!),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 21.0),
                      child: Text(
                        'ไม่มีรหัสผู้แนะนำ',
                        style: TextStyle(
                          fontSize: BaseSizes.fontBody1,
                          color: BaseColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                AppTextField(
                  isObscure: controller.isReferralCode.value,
                  enabled: !controller.isReferralCode.value,
                  controller.referralCode,
                  maxLength: 10,
                  textInputType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  labelText: 'รหัสผู้แนะนำ',
                  validator: controller.isReferralCode.value == false
                      ? (value) {
                          if (value == null || value.isEmpty) {
                            controller.isReferralCodeError.value = true;
                            return 'กรุณากรอกข้อมูล';
                          }
                          controller.isReferralCodeError.value = false;
                          return null;
                        }
                      : null,
                ),
                controller.isReferralCodeError.value == true
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            'หากไม่มีรหัสผู้แนะนำ ระบบจะทำใส่รหัสของบริษัทให้',
                            style: TextStyle(
                              color: BaseColors.btnDisabledPlaceholder,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                AppTextField(
                  controller.referralName,
                  labelText: 'ชื่อผู้แนะนำ',
                  enabled: false,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: PrimaryButtonView(
                    onPressed: () => {
                      FocusManager.instance.primaryFocus?.unfocus(),
                      if (controller.isReferralCode.value == true)
                        {controller.onTapped(1, pageViewController)}
                      else if (_formKey.currentState!.validate())
                        {controller.onTapped(1, pageViewController)}
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

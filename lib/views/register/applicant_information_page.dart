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

class ApplicantInformationPage extends GetView<RegisterPageViewController> {
  ApplicantInformationPage({super.key, required this.pageViewController});

  final PageController pageViewController;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => DismissibleKeyboard(
        child: RegisterAppScaffold(
          onGoBack: () => controller.onTapped(0, pageViewController),
          initialPage: 2,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      IconAssets.personalCard,
                      width: 20,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text(
                      'ข้อมูลผู้สมัคร',
                      style: TextStyle(
                        color: BaseColors.textPrimary,
                        fontSize: BaseSizes.fontH4,
                      ),
                    )
                  ],
                ),
                BottomSheetSelectMenu(
                  title: 'เลือกคำนำหน้าชื่อ',
                  label: 'คำนำหน้าชื่อ *',
                  onPressed: (value) => {
                    controller.isUserprefix.value = false,
                    controller.onSelectBottomSheet(
                      value,
                      controller.userPrefix,
                    ),
                  },
                  listObject: controller.prefixList,
                  initialValue: controller.userPrefix.value,
                  borderColor: controller.isUserprefix.value == true
                      ? Colors.red[600]
                      : BaseColors.textContent,
                ),
                // BottomSheetSelectMenu userPrefix validator
                controller.isUserprefix.value == true
                    ? Row(
                        children: [
                          Text(
                            'กรุณากรอกข้อมูล',
                            style: TextStyle(
                              color: Colors.red[600],
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    : Container(),
                BottomSheetSelectMenu(
                  margin: EdgeInsets.zero,
                  title: 'เลือกเพศ',
                  label: 'เพศ *',
                  onPressed: (value) => {
                    controller.isUserGender.value = false,
                    controller.onSelectBottomSheet(
                        value, controller.userGender),
                  },
                  listObject: controller.genderList,
                  initialValue: controller.userGender.value,
                  borderColor: controller.isUserGender.value == true
                      ? Colors.red[600]
                      : BaseColors.textContent,
                ),
                // BottomSheetSelectMenu userGender validator
                controller.isUserGender.value == true
                    ? Row(
                        children: [
                          Text(
                            'กรุณากรอกข้อมูล',
                            style: TextStyle(
                              color: Colors.red[600],
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    : Container(),
                AppTextField(
                  controller.userFullName,
                  labelText: 'ชื่อ - นามสกุล *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.userBirthDate,
                  readOnly: true,
                  onTap: () => {controller.datePicker()},
                  decoration: InputDecoration(
                    label: const Text(
                      'วันเกิด *',
                      style: TextStyle(
                        color: BaseColors.btnDisabledPlaceholder,
                        fontSize: BaseSizes.fontH4,
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(minHeight: 16),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: BaseColors.textContent),
                    ),
                    alignLabelWithHint: true,
                    constraints: const BoxConstraints(minHeight: 50),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.calendar_month_outlined,
                          ),
                        ],
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextField(
                  controller.userNationality,
                  labelText: 'สัญชาติ *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                AppTextField(
                  controller.userIdCard,
                  labelText: 'เลขประจำตัวประชาชน / พาสปอร์ต * ',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                AppTextField(
                  controller.userHomePhone,
                  labelText: 'โทรศัพท์บ้าน',
                ),
                AppTextField(
                  controller.userPhoneNumber,
                  labelText: 'โทรศัพท์มือถือ *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                AppTextField(
                  controller.userLineId,
                  labelText: 'ไลน์ ไอดี',
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: PrimaryButtonView(
                    onPressed: () => {
                      FocusManager.instance.primaryFocus?.unfocus(),
                      if (controller.userPrefix.value == '')
                        {
                          controller.isUserprefix.value = true,
                        },
                      if (controller.userGender.value == '')
                        {
                          controller.isUserGender.value = true,
                        },
                      if (_formKey.currentState!.validate())
                        {controller.onTapped(2, pageViewController)}
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

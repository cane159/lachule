import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/setting/user_setting_controller.dart';
import 'package:lachule/widgets/app_main_body.dart';
import 'package:lachule/widgets/bottom_sheet_select_menu.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:lachule/widgets/text_field/app_text_field.dart';

class UserSettingPage extends GetView<UserSettingController> {
  const UserSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => AppMainBody(
        title: 'แก้ไขข้อมูลส่วนตัว',
        child: Column(
          children: [
            Column(
              children: [
                BottomSheetSelectMenu(
                  title: 'เลือกคำนำหน้าชื่อ',
                  label: 'คำนำหน้าชื่อ *',
                  onPressed: (value) => {
                    controller.onSelectBottomSheet(
                      value,
                      controller.userPrefix,
                    ),
                  },
                  listObject: controller.prefixList,
                  initialValue: controller.userPrefix.value,
                  borderColor: BaseColors.textContent,
                ),
                BottomSheetSelectMenu(
                  margin: EdgeInsets.zero,
                  title: 'เลือกเพศ',
                  label: 'เพศ *',
                  onPressed: (value) => {
                    controller.onSelectBottomSheet(
                        value, controller.userGender),
                  },
                  listObject: controller.genderList,
                  initialValue: controller.userGender.value,
                  borderColor: BaseColors.textContent,
                ),
                AppTextField(
                  controller.userFullName,
                  labelText: 'ชื่อ - นามสกุล *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                AppTextField(
                  controller.userBirthDate,
                  labelText: 'วันเกิด *',
                  readOnly: true,
                  enabled: false,
                  suffixIcon: const Icon(
                    Icons.calendar_month_outlined,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                AppTextField(
                  controller.userIdCard,
                  enabled: false,
                  readOnly: true,
                  labelText: 'เลขประจำตัวประชาชน / พาสปอร์ต * ',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                AppTextField(
                  controller.userHomePhone,
                  labelText: 'โทรศัพท์บ้าน',
                ),
                AppTextField(
                  controller.userPhoneNumber,
                  labelText: 'โทรศัพท์มือถือ *',
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: controller.isPhoneNumberError.value == false
                      ? (value) {
                          if (value == null || value.isEmpty) {
                            controller.isPhoneNumberError.value = true;
                            return 'กรุณากรอกข้อมูล';
                          }
                          controller.isPhoneNumberError.value = false;
                          return null;
                        }
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputType: TextInputType.phone,
                ),
                controller.isPhoneNumberError.value == true
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            'ระบบจะส่ง OTP ให้เพื่อยืนยันเบอร์โทรก่อนบันทึกข้อมูล',
                            style: TextStyle(
                              color: BaseColors.btnDisabledPlaceholder,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                AppTextField(
                  controller.userLineId,
                  labelText: 'ไลน์ ไอดี',
                ),
                const SizedBox(
                  height: 50,
                ),
                PrimaryButtonView(
                  onPressed: () => {
                    controller.onPressedSubmit(),
                  },
                  title: 'บันทึก',
                  width: double.infinity,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

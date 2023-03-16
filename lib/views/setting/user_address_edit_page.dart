import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/setting/user_address_edit_controller.dart';
import 'package:lachule/widgets/app_main_body.dart';
import 'package:lachule/widgets/bottom_sheet_select_menu.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:lachule/widgets/text_field/app_text_field.dart';

class UserAddressEditPage extends GetView<UserAddressEditController> {
  const UserAddressEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => AppMainBody(
        title: 'ที่อยู่',
        bottomNavigationBar: _bottomNavBar(),
        child: Column(
          children: [
            controller.isMain
                ? Container()
                : Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: BaseColors.borderColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'เลือกเป็นที่อยู่ตั้งต้น',
                          style: TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: BaseSizes.fontH4,
                          ),
                        ),
                        Switch.adaptive(
                          value: controller.switchValue,
                          onChanged: (value) => {
                            controller.onPressedSwitch(value),
                          },
                          activeTrackColor: BaseColors.actived,
                          activeColor: BaseColors.actived,
                        ),
                      ],
                    ),
                  ),
            AppTextField(
              controller.houseNumber,
              labelText: 'บ้านเลขที่ *',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            AppTextField(
              controller.village,
              labelText: 'หมู่บ้าน / โครงการ',
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            AppTextField(
              controller.alley,
              labelText: 'ซอย *',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            BottomSheetSelectMenu(
              margin: const EdgeInsets.only(top: 15),
              title: 'จังหวัด',
              label: 'จังหวัด *',
              onPressed: (value) => {
                controller.onSelectBottomSheet(value, controller.province),
                controller.district.value = '',
                controller.subDistrict.value = '',
              },
              listObject: controller.provinceList,
              initialValue: controller.province.value,
              borderColor: BaseColors.textContent,
            ),
            BottomSheetSelectMenu(
              margin: const EdgeInsets.only(top: 15),
              title: 'อำเภอ / เขต',
              label: 'อำเภอ / เขต *',
              isDisable: controller.province.value == '' ? true : false,
              onPressed: (value) => {
                controller.onSelectBottomSheet(value, controller.district),
                controller.subDistrict.value = '',
              },
              listObject: controller.districtList,
              initialValue: controller.district.value,
              borderColor: BaseColors.textContent,
            ),
            BottomSheetSelectMenu(
              margin: const EdgeInsets.only(top: 15),
              title: 'อำเภอ / เขต',
              label: 'อำเภอ / เขต *',
              isDisable: controller.district.value == '' ? true : false,
              onPressed: (value) => {
                controller.onSelectBottomSheet(value, controller.subDistrict),
                controller.zipCode.text = controller
                    .subDistrictList[controller.subDistrictList
                        .indexWhere((element) => element.id == value)]
                    .zipCode,
              },
              listObject: controller.subDistrictList,
              initialValue: controller.subDistrict.value,
              borderColor: BaseColors.textContent,
            ),
            AppTextField(
              controller.zipCode,
              labelText: 'รหัสไปรษณีย์ *',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
              readOnly: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    return SafeArea(
      child: ClipRRect(
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
                  onPressed: () => controller.onPressedSubmit(),
                  title: 'บันทึก',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

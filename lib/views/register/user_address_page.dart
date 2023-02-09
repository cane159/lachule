import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/register/benefit_information_controller.dart';
import 'package:lachule/controllers/register/house_address_controller.dart';
import 'package:lachule/controllers/register/register_page_view_controller.dart';
import 'package:lachule/controllers/register/user_address_controller.dart';
import 'package:lachule/widgets/app_check_box.dart';
import 'package:lachule/widgets/bottom_sheet_select_menu.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';
import 'package:lachule/widgets/register_app_scaffold.dart';
import 'package:lachule/widgets/text_field/app_text_field.dart';

class UserAddressPage extends GetView<RegisterPageViewController> {
  UserAddressPage({super.key, required this.pageViewController});

  final PageController pageViewController;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => DismissibleKeyboard(
        child: RegisterAppScaffold(
          onGoBack: () => controller.onTapped(3, pageViewController),
          initialPage: 5,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      IconAssets.locationTick,
                      width: 20,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text(
                      'ที่อยู่ปัจจุบัน',
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
                        value: controller.isHourseAddress.value,
                        onChanged: (value) => {
                          controller.pressUserAddress(value!),
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 21.0),
                      child: Text(
                        'ใช้ตามที่อยู่ตามทะเบียนบ้าน',
                        style: TextStyle(
                          fontSize: BaseSizes.fontBody1,
                          color: BaseColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                AppTextField(
                  controller.userLiveHouseNumber,
                  labelText: 'บ้านเลขที่ *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                AppTextField(
                  controller.userVillageOrProject,
                  labelText: 'หมู่บ้าน / โครงการ',
                ),
                AppTextField(
                  controller.userAlley,
                  labelText: 'ซอย *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                BottomSheetSelectMenu(
                  title: 'จัวหวัด',
                  label: 'จังหวัด *',
                  onPressed: (value) => {
                    controller.onSelectBottomSheet(
                        value, controller.userProvince),
                    controller.userDistrict.value = '',
                    controller.userSubDistrict.value = '',
                  },
                  listObject: controller.provinceList,
                  initialValue: controller.userProvince.value,
                ),
                BottomSheetSelectMenu(
                  title: 'อำเภอ / เขต',
                  label: 'อำเภอ / เขต *',
                  isDisable: controller.userProvince.value == '' ? true : false,
                  onPressed: (value) => {
                    controller.onSelectBottomSheet(
                        value, controller.userDistrict),
                    controller.userSubDistrict.value = '',
                  },
                  listObject: controller.districtList,
                  initialValue: controller.userDistrict.value,
                ),
                BottomSheetSelectMenu(
                  title: 'ตำบล / แขวง',
                  label: 'ตำบล / แขวง *',
                  isDisable: controller.userDistrict.value == '' ? true : false,
                  onPressed: (value) => {
                    controller.onSelectBottomSheet(
                        value, controller.userSubDistrict),
                    controller.userZipCode.text = controller
                        .subDistrictList[controller.subDistrictList
                            .indexWhere((element) => element.id == value)]
                        .zipCode,
                  },
                  listObject: controller.subDistrictList,
                  initialValue: controller.userSubDistrict.value,
                ),
                AppTextField(
                  controller.userZipCode,
                  labelText: 'รหัสไปรษณีย์ *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                  readOnly: true,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: PrimaryButtonView(
                    onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {controller.onTapped(5, pageViewController)}
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

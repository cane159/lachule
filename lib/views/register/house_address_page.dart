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

class HouseAddressPage extends GetView<RegisterPageViewController> {
  HouseAddressPage({super.key, required this.pageViewController});

  final PageController pageViewController;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => DismissibleKeyboard(
        child: RegisterAppScaffold(
          onGoBack: () => controller.onTapped(2, pageViewController),
          initialPage: 4,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      IconAssets.homeHashtag,
                      width: 20,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text(
                      'ที่อยู่ตามทะเบียนบ้าน',
                      style: TextStyle(
                        color: BaseColors.textPrimary,
                        fontSize: BaseSizes.fontH4,
                      ),
                    )
                  ],
                ),
                AppTextField(
                  controller.userHouseNumber,
                  labelText: 'บ้านเลขที่ *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                AppTextField(
                  controller.userHouseVillageOrProject,
                  labelText: 'หมู่บ้าน / โครงการ',
                ),
                AppTextField(
                  controller.userHouseAlley,
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
                        value, controller.userHouseProvince),
                    controller.userHouseDistrict.value = '',
                    controller.userHouseSubDistrict.value = '',
                  },
                  listObject: controller.provinceList,
                  initialValue: controller.userHouseProvince.value,
                ),
                BottomSheetSelectMenu(
                  title: 'อำเภอ / เขต',
                  label: 'อำเภอ / เขต *',
                  isDisable:
                      controller.userHouseProvince.value == '' ? true : false,
                  onPressed: (value) => {
                    controller.onSelectBottomSheet(
                        value, controller.userHouseDistrict),
                    controller.userHouseSubDistrict.value = '',
                  },
                  listObject: controller.districtList,
                  initialValue: controller.userHouseDistrict.value,
                ),
                BottomSheetSelectMenu(
                  title: 'ตำบล / แขวง',
                  label: 'ตำบล / แขวง *',
                  isDisable:
                      controller.userHouseDistrict.value == '' ? true : false,
                  onPressed: (value) => {
                    controller.onSelectBottomSheet(
                        value, controller.userHouseSubDistrict),
                    controller.userHouseZipCode.text = controller
                        .subDistrictList[controller.subDistrictList
                            .indexWhere((element) => element.id == value)]
                        .zipCode,
                  },
                  listObject: controller.subDistrictList,
                  initialValue: controller.userHouseSubDistrict.value,
                ),
                AppTextField(
                  controller.userHouseZipCode,
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
                      controller.onTapped(4, pageViewController),
                      // if (_formKey.currentState!.validate())
                      //   {controller.onTapped(4, pageViewController)}
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

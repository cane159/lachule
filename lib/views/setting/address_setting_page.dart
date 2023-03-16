import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/setting/address_setting_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/app_main_body.dart';
import 'package:lachule/widgets/button/outline_button.dart';

class AddressSettingPage extends GetView<AddressSettingController> {
  const AddressSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return AppMainBody(
      title: 'แก้ไขข้อมูลที่อยู่',
      bottomNavigationBar: _bottomNavBar(),
      child: Column(
        children: [
          Column(
            children: controller.userAddress
                .map(
                  (data) => GestureDetector(
                    onTap: () => {
                      controller.cardPressed(
                        data.id,
                      ),
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: BaseColors.borderColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${data.houseNumber} ${data.village} ${data.alley} ${controller.provinceList[controller.provinceList.indexWhere((element) => element.id == data.provinceId)].name} ${controller.districtList[controller.districtList.indexWhere((element) => element.id == data.districtId)].name} ${controller.subDistrictList[controller.subDistrictList.indexWhere((element) => element.id == data.subDistrictId)].name} ${controller.subDistrictList[controller.subDistrictList.indexWhere((element) => element.id == data.subDistrictId)].zipCode}',
                              maxLines: 3,
                              style: const TextStyle(
                                color: BaseColors.textContent,
                                fontSize: BaseSizes.fontBody1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          data.isMain == true
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'ค่าเริ่มต้น',
                                      style: TextStyle(
                                        color: BaseColors.primaryRed,
                                        fontSize: BaseSizes.fontBody1,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      IconAssets.locationTick,
                                      width: 18,
                                      height: 18,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () => controller.onPressedDelete(),
                                  child: Image.asset(
                                    IconAssets.trashCan,
                                    width: 28,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavBar() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(22),
        width: double.infinity,
        child: OutlinedButtonView(
          onPressed: () => {},
          prefixIcon: Image.asset(
            IconAssets.plusCirlce,
            width: 14,
            fit: BoxFit.fitWidth,
          ),
          borderColor: BaseColors.borderColor,
          title: 'เพิ่มที่อยู่ใหม่',
          textStyle: const TextStyle(
            color: BaseColors.textPrimary,
            fontSize: BaseSizes.fontH4,
          ),
        ),
      ),
    );
  }
}

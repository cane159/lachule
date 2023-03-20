import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/profile_controller.dart';
import 'package:lachule/models/address_setting.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/app_main_body.dart';
import 'package:lachule/widgets/button/outline_button.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => AppMainBody(
        title: 'โปรไฟล์',
        action: [
          IconButton(
            onPressed: () => {
              controller.onPressedGift(),
            },
            icon: Image.asset(
              IconAssets.gift,
              width: 24,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
        bottomNavigationBar: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (controller.profileIndex == 0) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  width: double.infinity,
                  child: OutlinedButtonView(
                    onPressed: () => {
                      Get.toNamed(
                        AppRoutes.USERSETTING,
                        arguments: 'profile',
                      ),
                    },
                    title: 'แก้ไขข้อมูล',
                    borderColor: BaseColors.borderColor,
                    textStyle: const TextStyle(
                      fontSize: BaseSizes.fontH4,
                      color: BaseColors.textPrimary,
                    ),
                    prefixIcon: Image.asset(
                      IconAssets.edit,
                      width: 18,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
              if (controller.profileIndex == 2) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  width: double.infinity,
                  child: OutlinedButtonView(
                    onPressed: () => {
                      Get.toNamed(
                        AppRoutes.ADDRESSSETTING,
                        arguments: 'profile',
                      ),
                    },
                    title: 'แก้ไขข้อมูล',
                    borderColor: BaseColors.borderColor,
                    textStyle: const TextStyle(
                      fontSize: BaseSizes.fontH4,
                      color: BaseColors.textPrimary,
                    ),
                    prefixIcon: Image.asset(
                      IconAssets.edit,
                      width: 18,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        header: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.userProfile.fullName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: BaseSizes.fontH4,
                    ),
                  ),
                  Text(
                    controller.userProfile.memberCode,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: BaseSizes.fontBody2,
                    ),
                  ),
                ],
              ),
              OutlinedButtonView(
                onPressed: () => {
                  Get.toNamed(AppRoutes.WEBVIEW),
                },
                title: 'ระบบสมาชิก',
                prefixIcon: Image.asset(
                  IconAssets.securityUser,
                  width: 18,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _textButton(
                  0,
                  'ข้อมูลส่วนตัว',
                ),
                _textButton(
                  1,
                  'ผลประโยชน์',
                ),
                _textButton(
                  2,
                  'ที่อยู่',
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(17, 3, 17, 3),
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(color: BaseColors.borderColor),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  if (controller.profileIndex == 0) ...[
                    _userData(),
                  ],
                  if (controller.profileIndex == 1) ...[
                    _benefitData(),
                  ],
                  if (controller.profileIndex == 2) ...[
                    _addressData(),
                  ],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textButton(int index, String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: BaseColors.white,
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      onPressed: () => controller.pressedProfileTextButton(index),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 3,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: controller.profileIndex == index
              ? BaseColors.primaryRed
              : BaseColors.white,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: BaseSizes.fontBody1,
            color: controller.profileIndex == index
                ? BaseColors.white
                : BaseColors.btnDisabledPlaceholder,
          ),
          maxLines: 1,
        ),
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

  Widget _userData() {
    return Column(
      children: [
        _contentBody(
          'ชื่อ - นามสกุล',
          controller.userProfile.fullName,
        ),
        _contentBody(
          'วันเกิด',
          controller.dateFormat(controller.userProfile.dateOfBirth),
        ),
        _contentBody(
          'สัญชาติ',
          controller.userProfile.nationality,
        ),
        _contentBody(
          'เลขประจำตัวประชาชน',
          controller.userProfile.idCard,
        ),
        _contentBody(
          'โทรศัพท์บ้าน',
          controller.userProfile.homePhone,
        ),
        _contentBody(
          'โทรศัพท์มือถือ',
          controller.userProfile.phoneNumber,
        ),
        _contentBody(
          'ไลน์ ไอดี',
          controller.userProfile.lineId,
          isBottom: true,
        ),
      ],
    );
  }

  Widget _benefitData() {
    return Column(
      children: [
        _contentBody(
          'ธนาคาร',
          controller.userBenefit.bankName,
        ),
        _contentBody(
          'สาขา',
          controller.userBenefit.bankBranch,
        ),
        _contentBody(
          'ประเภทบัญชี',
          controller.userBenefit.bookBankType,
        ),
        _contentBody(
          'เลขบัญชี',
          controller.userBenefit.bookBankNumber,
        ),
        _contentBody(
          'ชื่อบัญชี',
          controller.userBenefit.bookBankName,
          isBottom: true,
        ),
      ],
    );
  }

  Widget _addressData() {
    return Column(
      children: controller.userAddress.asMap().entries.map((entry) {
        int index = entry.key;
        return _transportCard(
          'ที่อยู่ในการจัดส่ง',
          controller.connectUserAddressData(index),
          onPressed: () => {},
          isBottom: index == controller.userAddress.length - 1 ? true : false,
        );
      }).toList(),
    );
  }

  Widget _transportCard(
    String label,
    String title, {
    Function()? onPressed,
    bool isBottom = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: isBottom
              ? null
              : const Border(
                  bottom: BorderSide(
                    width: 1,
                    color: BaseColors.borderColor,
                  ),
                ),
        ),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: BaseColors.textContent,
                    fontSize: BaseSizes.fontBody1,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontBody1,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

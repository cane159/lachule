import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/register/register_page_view_controller.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';
import 'package:lachule/widgets/register_app_scaffold.dart';
import 'package:dotted_border/dotted_border.dart';

class DocumentPage extends GetView<RegisterPageViewController> {
  DocumentPage({super.key, required this.pageViewController});

  final PageController pageViewController;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => DismissibleKeyboard(
        child: RegisterAppScaffold(
          onGoBack: () => controller.onTapped(4, pageViewController),
          initialPage: 6,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      IconAssets.attachCircle,
                      width: 20,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text(
                      'เอกสารประกอบการสมัคร',
                      style: TextStyle(
                        color: BaseColors.textPrimary,
                        fontSize: BaseSizes.fontH4,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 21, 0, 16),
                      child: const Text(
                        'สำเนาบัตรประชาชนผู้สมัครหลัก *',
                        style: TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontH4,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => {
                    Get.bottomSheet(
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: Get.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          color: BaseColors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  'เลือกแหล่งที่มาของไฟล์',
                                  style: TextStyle(
                                    color: BaseColors.textPrimary,
                                    fontSize: BaseSizes.fontH4,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Image.asset(
                                    IconAssets.close,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () =>
                                  controller.getImageIdCardFromGallery(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: BaseColors.borderColor,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    Text(
                                      'แกลเลอรี่ภาพ',
                                      style: TextStyle(
                                        color: BaseColors.textContent,
                                        fontSize: BaseSizes.fontBody1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  controller.getImageIdCardFromCamera(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                margin: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: BaseColors.borderColor,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    Text(
                                      'กล้องถ่ายรูป',
                                      style: TextStyle(
                                        color: BaseColors.textContent,
                                        fontSize: BaseSizes.fontBody1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    padding: const EdgeInsets.all(15),
                    dashPattern: const [5, 5],
                    color: BaseColors.dottedBorderColor,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            IconAssets.attachFile,
                            width: 24,
                            fit: BoxFit.fitWidth,
                          ),
                          const Text(
                            'แนบไฟล์',
                            style: TextStyle(
                              color: BaseColors.textContent,
                              fontSize: BaseSizes.fontBody1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'อัปโหลดได้เฉพาะไฟล์ jpg/png จำนวน 1 ไฟล์ ขนาดไม่เกิน 10 Mb. ',
                      style: TextStyle(
                          color: BaseColors.btnDisabledPlaceholder,
                          fontSize: 11),
                    ),
                  ],
                ),
                controller.idCardImagePath.value != ''
                    ? Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: BaseColors.bgPrimary)),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: BaseColors.white,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Image.file(
                                  File(controller.idCardImagePath.value),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: BaseColors.bgPrimary,
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.idCardImage!.name,
                                      style: const TextStyle(
                                        color: BaseColors.textPrimary,
                                        fontSize: BaseSizes.fontBody1,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          RegisterPageViewController
                                              .getFileSizeString(
                                                  bytes: File(controller
                                                          .idCardImage!.path)
                                                      .lengthSync()),
                                          style: const TextStyle(
                                            color: BaseColors.tabTitle,
                                            fontSize: BaseSizes.fontBody1,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 21, 0, 16),
                      child: const Text(
                        'สำเนาบัญชีธนาคาร *',
                        style: TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontH4,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => {
                    Get.bottomSheet(
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: Get.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          color: BaseColors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  'เลือกแหล่งที่มาของไฟล์',
                                  style: TextStyle(
                                    color: BaseColors.textPrimary,
                                    fontSize: BaseSizes.fontH4,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Image.asset(
                                    IconAssets.close,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () =>
                                  controller.getImageBookBankFromGallery(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: BaseColors.borderColor,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    Text(
                                      'แกลเลอรี่ภาพ',
                                      style: TextStyle(
                                        color: BaseColors.textContent,
                                        fontSize: BaseSizes.fontBody1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  controller.getImageBookBankFromCamera(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                margin: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: BaseColors.borderColor,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    Text(
                                      'กล้องถ่ายรูป',
                                      style: TextStyle(
                                        color: BaseColors.textContent,
                                        fontSize: BaseSizes.fontBody1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    padding: const EdgeInsets.all(15),
                    dashPattern: const [5, 5],
                    color: BaseColors.dottedBorderColor,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            IconAssets.attachFile,
                            width: 24,
                            fit: BoxFit.fitWidth,
                          ),
                          const Text(
                            'แนบไฟล์',
                            style: TextStyle(
                              color: BaseColors.textContent,
                              fontSize: BaseSizes.fontBody1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'อัปโหลดได้เฉพาะไฟล์ jpg/png จำนวน 1 ไฟล์ ขนาดไม่เกิน 10 Mb. ',
                      style: TextStyle(
                          color: BaseColors.btnDisabledPlaceholder,
                          fontSize: 11),
                    ),
                  ],
                ),
                controller.bookBankImagePath.value != ''
                    ? Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: BaseColors.bgPrimary)),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: BaseColors.white,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Image.file(
                                  File(controller.bookBankImagePath.value),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: BaseColors.bgPrimary,
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.bookBankImage!.name,
                                      style: const TextStyle(
                                        color: BaseColors.textPrimary,
                                        fontSize: BaseSizes.fontBody1,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          RegisterPageViewController
                                              .getFileSizeString(
                                                  bytes: File(controller
                                                          .bookBankImage!.path)
                                                      .lengthSync()),
                                          style: const TextStyle(
                                            color: BaseColors.tabTitle,
                                            fontSize: BaseSizes.fontBody1,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: PrimaryButtonView(
                    onPressed: () => {
                      FocusManager.instance.primaryFocus?.unfocus(),
                      if (_formKey.currentState!.validate())
                        {controller.onTapped(6, pageViewController)}
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

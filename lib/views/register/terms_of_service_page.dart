import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/terms_of_service_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/app_check_box.dart';
import 'package:lachule/widgets/button/button_theme_helper.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:lachule/widgets/button/primary_button.dart';

class TermsOfServicePage extends GetView<TermsOfServiceController> {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => Scaffold(
        appBar: _appbar(),
        body: Stack(
          children: [
            _imageBg(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(
                      '${controller.detail} \n ${controller.detail}',
                      style: const TextStyle(
                        color: BaseColors.textPrimary,
                        fontSize: BaseSizes.fontBody1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _bottomNavBar(),
      ),
    );
  }

  Widget _imageBg() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          ImageAssets.splashBg,
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
      ],
    );
  }

  AppBar _appbar() {
    return AppBar(
      leading: const GoBackbutton(),
      leadingWidth: 36,
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'ข้อตกลง และเงื่อนไขการให้บริการ',
            style: TextStyle(
              color: BaseColors.textPrimary,
              fontSize: 21,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavBar() {
    return ClipRRect(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: AppCheckBox(
                    value: controller.isAccept,
                    onChanged: (value) => controller.isPressedAccept(value!),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'ฉันอ่านข้อตกลง เงื่อนไขการให้บริการ  และนโยบาย (PDPA) แล้ว',
                    style: TextStyle(
                      fontSize: BaseSizes.fontBody1,
                      color: BaseColors.textPrimary,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButtonView(
                    isDisable: !controller.isAccept,
                    onPressed: () => Get.toNamed(AppRoutes.REGISTERPAGEVIEW),
                    title: 'ยอมรับ',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      padding: ButtonThemeHelper.padding(
                        height: 50,
                      ),
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                          color: BaseColors.primaryRed,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'ไม่ยอมรับ',
                          style: TextStyle(
                            fontSize: BaseSizes.fontH4,
                            color: BaseColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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

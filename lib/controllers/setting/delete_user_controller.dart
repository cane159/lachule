import 'package:flutter/material.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/models/benefit_setting.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/aleart/alert.dart';

class DeleteUserController extends BaseController {
  String deleteUserText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus pellentesque ullamcorper scelerisque pulvinar libero semper id enim id. Viverra at quis elit non maecenas consectetur non. Tellus commodo morbi arcu tellus. Ut aenean porttitor porttitor id faucibus adipiscing proin.Elit, commodo mollis diam egestas. Nascetur nisi sit maecenas nisi, sed. Tincidunt nunc mauris mi, ut vitae suspendisse. Sit ornare suspendisse elit interdum vestibulum at purus viverra. Ut tempus vitae libero faucibus. Nulla id pharetra purus in magna cursus consectetur. Amet, duis gravida urna, nunc.Arcu quis in tincidunt aliquam malesuada sit. Proin consectetur neque, nec, in. Fermentum scelerisque ipsum risus luctus lorem in mauris adipiscing hendrerit. Enim, venenatis ornare fames urna enim in feugiat. Proin sed donec.';

  void onPressedDelete() {
    Get.bottomSheet(
      AlertView(
        onPressedOutline: () => {
          Get.back(),
        },
        onPressedPrimary: () => {
          Get.offAllNamed(AppRoutes.FIRSTMENU),
        },
        icon: Image.asset(
          IconAssets.trashRed,
          width: 60,
          fit: BoxFit.fitWidth,
        ),
        buttonTextOutline: 'ยกเลิก',
        buttonTextStyleOutline: const TextStyle(
          color: BaseColors.textPrimary,
          fontSize: BaseSizes.fontH4,
        ),
        buttonTextPrimary: 'ยืนยัน',
        buttonTextStylePrimary: const TextStyle(
          color: BaseColors.white,
          fontSize: BaseSizes.fontH4,
        ),
        title: 'ยืนยันการลบบัญชีผู้ใช้นี้หรือไม่',
        titleStyle: const TextStyle(
          color: BaseColors.textPrimary,
          fontSize: 21,
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/routes/app_pages.dart';

class SuccessController extends BaseController {
  void pressConfirm() {
    Get.offAllNamed(AppRoutes.HOMEPAGEVIEW);
    startLoading();
  }
}

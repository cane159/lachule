import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/storage/app_prefs.dart';

class FirstMenuController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(const Duration(milliseconds: 500), () {
      state.value = false;
    });

    super.onInit();
  }

  final AppPrefs _appPrefs = Get.find();

  static RxBool state = true.obs;
  static const animateDuration = Duration(microseconds: 25000);

  void pressedSkip() {
    _appPrefs.userRole.setValue('guest');
    Get.toNamed(AppRoutes.HOMEPAGEVIEW);
    startLoading();
  }
}

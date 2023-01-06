import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/routes/app_pages.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    timer();
    super.onInit();
  }

  Future<void> timer() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(
      AppRoutes.FIRSTMENU,
    );
  }
}

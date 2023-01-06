import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';

class FirstMenuController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    Future.delayed(const Duration(milliseconds: 500), () {
      state.value = false;
    });

    super.onInit();
  }

  static RxBool state = true.obs;
  static const animateDuration = Duration(microseconds: 25000);
}

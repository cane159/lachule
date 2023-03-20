import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/routes/app_pages.dart';

class ForgetPasswordController extends BaseController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

  void onSubmit() {
    Get.toNamed(AppRoutes.OTP, arguments: {
      'page': 'forget_password',
      'phoneNumber': userPhoneController.text,
    });
  }
}

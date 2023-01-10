import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:lachule/routes/app_pages.dart';

class LoginController extends BaseController {
  final String userLabel = 'หมายเลขสมาชิก';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void pressLogin() {
    Get.offAllNamed(AppRoutes.HOME);
    startLoading();
  }
}

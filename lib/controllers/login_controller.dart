import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/storage/app_prefs.dart';

class LoginController extends BaseController {
  final String userLabel = 'หมายเลขสมาชิก';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AppPrefs _appPrefs = Get.find();

  void pressLogin() {
    _appPrefs.userRole.setValue('member');
    Get.offAllNamed(AppRoutes.HOMEPAGEVIEW);
    startLoading();
  }
}

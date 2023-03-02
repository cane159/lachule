import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    _initPackageInfo();

    super.onInit();
  }

  final _appVersion = ''.obs;

  // Getter

  String get appVersion => _appVersion.value;

  Future<void> _initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    _appVersion.value = packageInfo.version;
  }
}

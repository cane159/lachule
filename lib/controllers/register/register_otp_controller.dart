import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/aleart/alert.dart';

class RegisterOtpController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    if (Get.arguments == 'register') {
      _fromPage.value = Get.arguments;
    }
    if (Get.arguments == 'profile') {
      _fromPage.value = Get.arguments;
    }
    if (Get.arguments == 'setting') {
      _fromPage.value = Get.arguments;
    }
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    _startTimer(180);
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  final testOTP = '111111';
  final _isOtpError = false.obs;
  final _isTimeOut = false.obs;
  Timer? _timer;
  int remainSeconds = 1;
  final _fromPage = ''.obs;

  // Getter
  bool get isOtpError => _isOtpError.value;
  bool get isTimeOut => _isTimeOut.value;

  final time = '03.00'.obs;

  void onTappedOtpPage(
    String otp,
  ) {
    // if page from register
    if (_fromPage.value == 'register') {
      if (otp == testOTP && remainSeconds != 0) {
        _isOtpError.value = false;
        Get.toNamed(AppRoutes.REGISTERPAYMENT);
      }
      if (otp != testOTP) {
        _isOtpError.value = true;
      } else {
        _isOtpError.value = true;
      }
    }
    // if page from profile
    if (_fromPage.value == 'profile') {
      if (otp == testOTP && remainSeconds != 0) {
        _isOtpError.value = false;
        Get.offAllNamed(
          AppRoutes.PROFILE,
          predicate: (route) => Get.currentRoute == '/profile',
        );
      }
      if (otp != testOTP) {
        _isOtpError.value = true;
      } else {
        _isOtpError.value = true;
      }
    }
    if (_fromPage.value == 'setting') {
      if (otp == testOTP && remainSeconds != 0) {
        _isOtpError.value = false;
        Get.bottomSheet(
          AlertView(
            onPressedOutline: () => {
              Get.offAllNamed(
                AppRoutes.PERSONALINFORMATIONSETTING,
                predicate: (route) =>
                    Get.currentRoute == '/personal_information_setting',
              ),
            },
            title: 'แก้ไขข้อมูลเรียบร้อยแล้ว',
            buttonTextOutline: 'รับทราบ',
            buttonTextStyleOutline: const TextStyle(
              color: BaseColors.textPrimary,
              fontSize: BaseSizes.fontH4,
            ),
          ),
        );
      }
      if (otp != testOTP) {
        _isOtpError.value = true;
      } else {
        _isOtpError.value = true;
      }
    }
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainSeconds == 0) {
        time.value = "00.00";
        remainSeconds--;
        _isTimeOut.value = true;
        timer.cancel();
      } else {
        int minutes = remainSeconds ~/ 60;
        int seconds = remainSeconds % 60;
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainSeconds--;
      }
    });
  }
}

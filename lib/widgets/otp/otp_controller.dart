import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/aleart/alert.dart';

class OtpController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    if (Get.arguments['page'] == 'profile') {
      _fromPage.value = Get.arguments['page'];
      _userPhoneNumber.value = Get.arguments['phoneNumber'];
    }
    if (Get.arguments['page'] == 'setting') {
      _fromPage.value = Get.arguments['page'];
      _userPhoneNumber.value = Get.arguments['phoneNumber'];
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
  final _userPhoneNumber = ''.obs;

  // Getter
  bool get isOtpError => _isOtpError.value;
  bool get isTimeOut => _isTimeOut.value;
  String get userPhoneNumber => _userPhoneNumber.value;

  final time = '03.00'.obs;

  void onTappedOtpPage(
    String otp,
  ) {
    print(_userPhoneNumber.value);
    // if page from profile
    if (_fromPage.value == 'profile') {
      if (otp == testOTP && remainSeconds != 0) {
        _isOtpError.value = false;
        Get.bottomSheet(
          AlertView(
            onPressedOutline: () => {
              Get.offNamedUntil(
                AppRoutes.PROFILE,
                ModalRoute.withName('/home_page_view'),
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
      } else if (otp != testOTP) {
        _isOtpError.value = true;
      } else {
        _isOtpError.value = true;
      }
    }
    // if page from setting
    if (_fromPage.value == 'setting') {
      if (otp == testOTP && remainSeconds != 0) {
        _isOtpError.value = false;
        Get.bottomSheet(
          AlertView(
            onPressedOutline: () => {
              Get.offNamedUntil(
                AppRoutes.PERSONALINFORMATIONSETTING,
                ModalRoute.withName('/home_page_view'),
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
      } else if (otp != testOTP) {
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

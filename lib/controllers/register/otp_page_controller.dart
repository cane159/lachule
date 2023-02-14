import 'dart:async';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/routes/app_pages.dart';

class OTPPageController extends BaseController {
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

  // Getter
  bool get isOtpError => _isOtpError.value;
  bool get isTimeOut => _isTimeOut.value;

  final time = '03.00'.obs;

  void onTappedOtpPage(
    String otp,
  ) {
    if (otp == testOTP && remainSeconds != 0) {
      _isOtpError.value = false;
      Get.toNamed(AppRoutes.REGISTERPAYMENT);
    }
    if (otp != testOTP) {
      _isOtpError.value = true;
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

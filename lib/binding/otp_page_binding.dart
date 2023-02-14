import 'package:get/get.dart';
import 'package:lachule/controllers/pdpa_controller.dart';
import 'package:lachule/controllers/register/otp_page_controller.dart';

class OTPPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OTPPageController());
  }
}

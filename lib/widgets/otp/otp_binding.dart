import 'package:get/get.dart';
import 'package:lachule/controllers/register/register_otp_controller.dart';
import 'package:lachule/widgets/otp/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}

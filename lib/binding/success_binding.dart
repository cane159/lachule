import 'package:get/get.dart';
import 'package:lachule/controllers/register/payment_gateway_controller.dart';
import 'package:lachule/controllers/register/success_controller.dart';

class SuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessController());
  }
}

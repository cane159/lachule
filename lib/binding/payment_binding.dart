import 'package:get/get.dart';
import 'package:lachule/controllers/register/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}

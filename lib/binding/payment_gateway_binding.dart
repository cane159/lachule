import 'package:get/get.dart';
import 'package:lachule/controllers/register/payment_gateway_controller.dart';

class PaymentGatewayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentGatewayController());
  }
}

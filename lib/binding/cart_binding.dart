import 'package:get/get.dart';
import 'package:lachule/controllers/cart_controller.dart';
import 'package:lachule/controllers/login_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}

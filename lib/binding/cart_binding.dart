import 'package:get/get.dart';
import 'package:lachule/controllers/cart_controller.dart';
import 'package:lachule/controllers/login_controller.dart';
import 'package:lachule/core/network/qr_client.dart';
import 'package:lachule/service/qr_service.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => QRService());
    Get.lazyPut(() => QRClient());
  }
}

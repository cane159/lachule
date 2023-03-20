import 'package:get/get.dart';
import 'package:lachule/controllers/first_menu_controller.dart';
import 'package:lachule/controllers/forget_password_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}

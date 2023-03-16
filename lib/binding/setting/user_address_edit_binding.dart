import 'package:get/get.dart';
import 'package:lachule/controllers/setting/user_address_edit_controller.dart';

class UserAddressEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserAddressEditController());
  }
}

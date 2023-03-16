import 'package:get/get.dart';
import 'package:lachule/controllers/setting/address_setting_controller.dart';

class AddressSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressSettingController());
  }
}

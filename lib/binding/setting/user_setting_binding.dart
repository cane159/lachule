import 'package:get/get.dart';
import 'package:lachule/controllers/setting/user_setting_controller.dart';

class UserSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserSettingController());
  }
}

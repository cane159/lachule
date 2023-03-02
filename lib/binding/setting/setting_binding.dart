import 'package:get/get.dart';
import 'package:lachule/controllers/setting/setting_controlelr.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}

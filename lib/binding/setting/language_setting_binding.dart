import 'package:get/get.dart';
import 'package:lachule/controllers/setting/language_setting_controller.dart';

class LanguageSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageSettingController());
  }
}

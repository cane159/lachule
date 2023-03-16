import 'package:get/get.dart';
import 'package:lachule/controllers/setting/benefit_setting_controller.dart';

class BenefitSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BenefitSettingController());
  }
}

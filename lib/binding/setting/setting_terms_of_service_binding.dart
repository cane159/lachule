import 'package:get/get.dart';
import 'package:lachule/controllers/setting/setting_terms_of_service_controller.dart';

class SettingTermsOfServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingTermsOfServiceController());
  }
}

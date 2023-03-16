import 'package:get/get.dart';
import 'package:lachule/controllers/setting/personal_information_setting_controller.dart';

class PersonalInformationSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalInformationSettingController());
  }
}

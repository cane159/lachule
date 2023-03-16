import 'package:get/get.dart';
import 'package:lachule/controllers/setting/delete_user_controller.dart';
import 'package:lachule/controllers/setting/noti_setting_controller.dart';

class NotiSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotiSettingController());
  }
}

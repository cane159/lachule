import 'package:lachule/bases/base_controller.dart';
import 'package:get/get.dart';
import 'package:lachule/models/benefit_setting.dart';

class NotiSettingController extends BaseController {
  final _isNoti = false.obs;

  // Getter
  bool get isNoti => _isNoti.value;

  void onPressedSwitch(bool value) {
    _isNoti.value = value;
  }
}

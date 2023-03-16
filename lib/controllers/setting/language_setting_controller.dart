import 'package:lachule/bases/base_controller.dart';
import 'package:get/get.dart';

class LanguageSettingController extends BaseController {
  final _isThai = true.obs;

  // Getter
  bool get isThai => _isThai.value;

  void pressedThai() {
    _isThai.value = true;
  }

  void pressedEnglish() {
    _isThai.value = false;
  }
}

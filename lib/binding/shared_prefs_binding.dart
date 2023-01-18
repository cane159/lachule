import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/app_prefs.dart';

class SharedPrefsBinding {
  Future<void> init() async {
    await Get.putAsync(
      () async => await SharedPreferences.getInstance(),
    );
    Get.put(AppPrefs());
  }
}

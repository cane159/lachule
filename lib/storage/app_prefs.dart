import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:titum/models/auth.dart';

//เก็บข้อมูลของ App
class AppPrefs {
  PrefsModel<String> accessToken = PrefsModel(prefAccessToken);
  PrefsModel<String> registerToken = PrefsModel(prefTokenRegister);
  PrefsModel<bool> isOfficial = PrefsModel(prefIsOfficial);
  PrefsModel<String> appaID = PrefsModel(prefappaID);
  PrefsModel<String> premiumID = PrefsModel(prefpremiumID);
  PrefsModel<String> id = PrefsModel(prefId);
  PrefsModel<bool> notificationEnable = PrefsModel(prefNotificationEnable);
  PrefsModel<bool> isLogout = PrefsModel(prefIsLogout);
  PrefsModel<String> lastOpenedAt = PrefsModel(prefLastOpenedAt);
  PrefsModel<String> locale = PrefsModel(prefLocale);
  PrefsModel<String> userId = PrefsModel(prefUserId);
  PrefsModel<String> userRole = PrefsModel(prefUserRole);

  static const String prefAccessToken = 'prefAccessToken';
  static const String prefId = 'prefId';
  static const String prefappaID = 'prefappaID';
  static const String prefpremiumID = 'prefpremiumID';
  static const String prefIsOfficial = 'prefIsOfficial';
  static const String prefTokenRegister = 'prefTokenRegister';
  static const String prefNotificationEnable = 'App_notification_enable';
  static const String prefIsLogout = 'App_is_logout';
  static const String prefLastOpenedAt = 'App_lastOpenedAt';
  static const String prefLocale = 'App_locale';
  static const String prefUserId = 'App_userId';
  static const String prefUserRole = 'App_userRole';

  // Future<void> setAuth(Auth auth) async {
  //   await accessToken.setValue(auth.accessToken);
  // }

  Future<void> clearAuth() async {
    await lastOpenedAt.remove();
    await accessToken.remove();
  }
}

class PrefsModel<T> {
  final SharedPreferences _prefs = Get.find();

  PrefsModel(this.key);

  final String key;

  T? get value {
    switch (T) {
      case String:
        return _prefs.getString(key) as T?;
      case int:
        return _prefs.getInt(key) as T?;
      case bool:
        return _prefs.getBool(key) as T?;
    }
    return null;
  }

  Future<bool> setValue(T? value) async {
    switch (T) {
      case String:
        return await _prefs.setString(key, value as String);
      case int:
        return await _prefs.setInt(key, value as int);
      case bool:
        return await _prefs.setBool(key, value as bool);
    }
    return false;
  }

  Future<void> remove() async {
    await _prefs.remove(key);
  }
}

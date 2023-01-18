import 'package:lachule/binding/network_binding.dart';

import 'shared_prefs_binding.dart';

class GlobalBinding {
  // ไม่เกี่ยวข้างกับ view ไม่ต้อง run app ก็ binding ได้เลย
  Future<void> init() async {
    await SharedPrefsBinding().init();
    NetworkBinding().dependencies();
  }
}

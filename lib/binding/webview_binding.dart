import 'package:get/get.dart';
import 'package:lachule/controllers/webview_controller.dart';

class WebviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebviewController());
  }
}

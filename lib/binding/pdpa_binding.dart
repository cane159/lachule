import 'package:get/get.dart';
import 'package:lachule/controllers/pdpa_controller.dart';

class PDPABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PDPAController());
  }
}

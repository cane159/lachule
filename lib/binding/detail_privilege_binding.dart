import 'package:get/get.dart';
import 'package:lachule/controllers/detail_privilege_controller.dart';

class DetailPrivilegeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailPrivilegeController());
  }
}

import 'package:get/get.dart';
import 'package:lachule/bases/loading/loading_controller.dart';
import 'package:lachule/controllers/first_menu_controller.dart';

class FirstMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstMenuController());
    Get.lazyPut(() => LoadingController());
  }
}

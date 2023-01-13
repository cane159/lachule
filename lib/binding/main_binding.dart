import 'package:get/get.dart';
import 'package:lachule/bases/loading/loading_controller.dart';
import 'package:lachule/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoadingController());
    Get.lazyPut(() => MainController());
  }
}

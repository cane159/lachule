import 'package:get/get.dart';
import 'package:lachule/controllers/home_controller.dart';
import 'package:lachule/widgets/bottomNavigationBar/app_bottom_navigation_bar_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AppBottomnavigationBarController());
  }
}

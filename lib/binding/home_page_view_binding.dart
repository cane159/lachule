import 'package:get/get.dart';
import 'package:lachule/controllers/home_controller.dart';
import 'package:lachule/controllers/home_page_view_controller.dart';
import 'package:lachule/controllers/notification_controller.dart';

class HomePageViewBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomePageViewController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NotificationController());
  }
}

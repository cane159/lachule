import 'package:get/get.dart';
import 'package:lachule/core/network/client.dart';
import 'package:lachule/service/notification_servide.dart';

class NetworkBinding extends Bindings {
  //
  @override
  void dependencies() {
    Get.create(() => Client());

    // inject service
    Get.create(() => NotificationService());
  }
}

import 'package:get/get.dart';
import 'package:lachule/controllers/setting/delete_user_controller.dart';

class DeleteUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeleteUserController());
  }
}

import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/service/app_service.dart';
import 'package:lachule/service/notification_servide.dart';

class NotificationController extends BaseController {
  final NotificationService _notiService = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    startLoading();
    // AppService.call(
    //   context: Get.context!,
    //   request: _notiService.getHistory(),
    //   onSuccess: (response) async {
    //     print('================Success push device================');
    //   },
    //   onFail: (response) async {
    //     print('================Fail push device================');
    //   },
    // );
    //stopLoad();
    super.onInit();
  }

  void _fetchNotiHistory() {}
}

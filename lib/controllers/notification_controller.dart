import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/core/network/network_exception.dart';
import 'package:lachule/models/notification_data.dart';
import 'package:lachule/models/pushgear_data.dart';
import 'package:lachule/models/raw_data_notification.dart';
import 'package:lachule/service/app_service.dart';
import 'package:lachule/service/notification_servide.dart';

class NotificationController extends BaseController {
  final NotificationService _notiService = Get.find();
  late RxList<NotificationData> notificationListData = RxList([]);

  ScrollController scrollController = ScrollController();

  // Getter

  @override
  void onInit() async {
    // TODO: implement onInit
    //startLoading();

    //stopLoad();
    print(
        "=====================================================================");
    await _fetchNotiHistory();
    print(
        "=====================================================================");
    //print(result);

    super.onInit();
  }

  Future<void> _fetchNotiHistory() async {
    try {
      await _notiService
          .getHistory()
          .then((response) => mapPushgearsData(response.results));
    } on NetworkException catch (e) {
      return;
    }
  }

  List<NotificationData>? mapPushgearsData(List<PushgearsData>? results) {
    final notiResult = results?.map((data) {
      final item = jsonDecode(data.rawData ?? '{}');
      var rawData = jsonDecode(jsonEncode(item["notification"]));
      var rawDataNotification = RawDataNotification.fromJson(rawData);

      var result = NotificationData(
        body: rawDataNotification.body,
        createDate: data.createDt,
        id: data.id,
        pushRequest: jsonEncode(item["data"]["push_request"]),
        readed: data.readed,
        requester: "",
        title: rawDataNotification.title,
        type: "",
        user: data.user,
      );

      return result;
    }).toList();

    notificationListData.addAll(notiResult ?? []);

    return notiResult;
  }
}

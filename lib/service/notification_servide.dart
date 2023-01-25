import 'package:get/get.dart';
import 'package:lachule/core/network/client.dart';
import 'package:lachule/models/app_response.dart';
import 'package:lachule/models/pushgear_history.dart';
import 'package:lachule/models/pushgear_response.dart';

class NotificationService {
  final Client _client = Get.find();

  Future<PushGearResponse> createDevice({
    required String userID,
    required String deviceToken,
  }) async {
    try {
      final response = await _client.post(
        '/application_user/$userID/add_device/',
        data: {
          'app_id': '36f2b310-5f15-11ed-81ad-5fded184eaa2-0A4lB0TT1pyGJuMe',
          'app_secret':
              'NhKiDpEDdFi1TbHmWn5jdSiV6C29y9igHXqoAlAbfueTQtbC87OPo5Ly3YGjaxCx',
          'device_token': deviceToken,
        },
        // isAuth: true,
      );
      return PushGearResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PushgearsHistory> getHistory() async {
    try {
      final response = await _client.get(
        '/push_message/?user=pushgears_dev_1234',
      );
      return PushgearsHistory.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

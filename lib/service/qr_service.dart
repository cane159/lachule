import 'package:get/get.dart';
import 'package:lachule/core/network/noti_client.dart';
import 'package:lachule/core/network/qr_client.dart';
import 'package:lachule/models/app_response.dart';
import 'package:lachule/models/pushgear_history.dart';
import 'package:lachule/models/pushgear_response.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class QRService {
  final QRClient _client = Get.find();

  String hs256() {
    final jwt = JWT(
      {
        "merchantID": "JT04",
        "invoiceNo": "1523953661",
        "description": "item 1",
        "amount": 10.00,
        "currencyCode": "SGD",
        "paymentChannel": ["THQR"]
      },
    );
    return jwt.sign(
      SecretKey(
          'CD229682D3297390B9F66FF4020B758F4A5E625AF4992E5D75D311D6458B38E2'),
    );
  }

  Future<PushGearResponse> getPaymentToken({
    required String userID,
    required String deviceToken,
  }) async {
    try {
      final response = await _client.post(
        '/payment/4.1/paymentToken',
        data: {
          'payload': hs256(),
        },
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

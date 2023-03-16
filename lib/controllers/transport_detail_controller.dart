import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/product.dart';
import 'package:lachule/models/transport_detail.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TransportDetailController extends BaseController {
  final formatCurrency = NumberFormat("#,##0.00", "th_TH");

  final _transportDetail = TransportDetailModel(
    id: '1',
    orderNumber: '72489',
    orderDate: '2023-02-25T03:54:08.931948Z',
    status: 'รอดำเนินการ',
    price: 1600,
    point: 50,
    address: 'เลขที่ 888 ถนนรัชดาภิเษก 15 แขวงดินแดง เขตดินแดง กรุงเทพฯ 10400',
    parcelNumber: 'RT1294058HM',
    product: [
      ProductModel(
        id: '1',
        name: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
        price: 1600,
        tag: 'ผลิตภัณฑ์ทำความสะอาด',
        point: 50,
        image:
            'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      )
    ],
  ).obs;

  // Getter
  TransportDetailModel get transportDetail => _transportDetail.value;

  String priceIntl(double value) {
    return formatCurrency.format(value);
  }
}

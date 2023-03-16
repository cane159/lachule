import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/cart_item.dart';
import 'package:lachule/service/qr_service.dart';

class CartController extends BaseController {
  final QRService _qrService = Get.find();

  final formatCurrency = NumberFormat("#,##0.00", "th_TH");
  final ScrollController scrollController = ScrollController();
  final userAddresss = '888 ถ. รัชดาภิเษก ดินแดง เขตดินแดง กรุงเทพมหานคร 10400';
  final RxList<CartItemModel> _cartItem = [
    CartItemModel(
        id: '1',
        name: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
        image:
            'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
        amount: 1.obs,
        price: 1600.00.obs,
        point: 30),
    CartItemModel(
      id: '2',
      name: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      amount: 2.obs,
      price: 1250.00.obs,
      point: 50,
    ),
  ].obs;

  // Getter
  RxList<CartItemModel> get cartItem => _cartItem;

  void changeCartItemAmount(int index, int value) {
    _cartItem[index].amount.value = value;
  }

  void cartPlus(int index) {
    _cartItem[index].amount.value = _cartItem[index].amount.value + 1;
  }

  void cartMinus(int index) {
    if (_cartItem[index].amount.value <= 0) {
      _cartItem[index].amount.value = 0;
    } else {
      _cartItem[index].amount.value = _cartItem[index].amount.value - 1;
    }
  }

  void pressedBuy() async {
    var response = await _qrService.getPaymentToken();
    print(response);
  }
}

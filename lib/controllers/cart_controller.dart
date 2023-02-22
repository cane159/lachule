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
            'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1677456000&Signature=AG38gqp9BdjbDlhIwI6~gA0enlIu9qeZJjTJZkvnWvWAr86ZZjJ~rGl9IGWpoXaH5NjrSlZ6BPGsVDt9~qQYdMfGjLgYmm8E4ndqubhEzLBKqgA0TgPsUkdPAvd3vjeg9sEsP-AgwLsWqehQ-V8YwGAAoriN3uD-vqjsSmB6-912ySclQLmpaq8S9xToeIaD7MptAIWgVjJnyZTzIs856T6qziH5NdWtMI3xRlzSmCon1P2h7SIO9xfy9nQ9ze6iCFhNsFf1izprvhsw3BYUvk9S3J04eb5qj7RJvAS2YKueWSlm1kaY5N2JDc8axqbS5HSykt1~aSc6qsht0iGZ0g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
        amount: 1.obs,
        price: 1600.00.obs,
        point: 30),
    CartItemModel(
      id: '2',
      name: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1677456000&Signature=AG38gqp9BdjbDlhIwI6~gA0enlIu9qeZJjTJZkvnWvWAr86ZZjJ~rGl9IGWpoXaH5NjrSlZ6BPGsVDt9~qQYdMfGjLgYmm8E4ndqubhEzLBKqgA0TgPsUkdPAvd3vjeg9sEsP-AgwLsWqehQ-V8YwGAAoriN3uD-vqjsSmB6-912ySclQLmpaq8S9xToeIaD7MptAIWgVjJnyZTzIs856T6qziH5NdWtMI3xRlzSmCon1P2h7SIO9xfy9nQ9ze6iCFhNsFf1izprvhsw3BYUvk9S3J04eb5qj7RJvAS2YKueWSlm1kaY5N2JDc8axqbS5HSykt1~aSc6qsht0iGZ0g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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

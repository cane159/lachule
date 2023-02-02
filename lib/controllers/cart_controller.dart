import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/cart_item.dart';

class CartController extends BaseController {
  final formatCurrency = NumberFormat("#,##0.00", "th_TH");
  final ScrollController scrollController = ScrollController();
  final userAddresss = '888 ถ. รัชดาภิเษก ดินแดง เขตดินแดง กรุงเทพมหานคร 10400';
  final RxList<CartItemModel> _cartItem = [
    CartItemModel(
        id: '1',
        name: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
        image:
            'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1675641600&Signature=B1H9XxWD~9cGE7pWnU4LzTwnNodtVm4IPZfLXL~4~70LxfCScKcwjuQtbfv9hD9ZyXdy1mGdwAqVI7oajsBBYHlGfAHXg8KXX-5~VBO4XmJ8uqL0-uL1e3~zqhKLDGxsWA7lPNc~Z7V-nZO3zP6dVN31Sgij8~TfDGFwXC2TM0ifFsJUj15U13IcWCA-561zqbEC1RCYKXnfHmJf6jpyRFS5MxHYpD85D5Dv4T2U7PyYwTn8SC~DAC6BQm0Q0wSWaEDKiNXIgkUzTID9h0xfQDd7WjCSDybkvv7iU9S2oebvyN2751Hq1b1amN5rlCi05FXxY-I4GmKLKQDDbQseXw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
        amount: 1.obs,
        price: 1600.00.obs,
        point: 30),
    CartItemModel(
      id: '2',
      name: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
      image:
          'https://s3-alpha-sig.figma.com/img/b1ba/e3e3/34e6da74237e9f02d71af77e00c00aa6?Expires=1675641600&Signature=QrZvOWqejBfxjm4qei~phMooCfu8pZtI7O-UB10So3yGSjLtQXFIWC6TWgzKLZEhhbHb1-1R-uukf4gs5h12d7j8WujIgCr5i3DoNQpoKVy0uDiwhM73-CjOF2J5m95za-88qbmT1C8BdrYPUpjA7mqL3tuZTTpqnV22zMJC2wGfAhHrM2iKjnKACvseJnD9xxDg4jZy4BY~bPTu8I5ze2VbeuT5ZgQ4147VRK7Ye-rPg8GgsdS-qbu~TbyuoMtuONZ2YuR4~vzK6t~iwdf6PLrB1ijJRFPB2o6v2BRL0KeagM-HYQ9RNpd3rGg-~t3kdz-57a6El5VxMvbRw0cllQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
}

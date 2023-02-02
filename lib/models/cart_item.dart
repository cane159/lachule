import 'package:get/get.dart';

class CartItemModel extends Object {
  final String id;
  final String name;
  final String image;
  late RxInt amount;
  late RxDouble price;
  final int point;
  CartItemModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.amount,
      required this.price,
      required this.point});
}

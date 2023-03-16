import 'package:lachule/models/product.dart';

class TransportDetailModel extends Object {
  final String id;
  final String orderNumber;
  final String orderDate;
  final String status;
  final double price;
  final int point;
  final String address;
  final String? parcelNumber;
  final List<ProductModel> product;
  TransportDetailModel({
    required this.id,
    required this.orderNumber,
    required this.orderDate,
    required this.status,
    required this.price,
    required this.point,
    required this.address,
    this.parcelNumber,
    required this.product,
  });
}

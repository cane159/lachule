class PromotionDetailModel extends Object {
  final String id;
  final String title;
  final String image;
  final String description;
  final String endDate;
  final double price;
  final int point;
  PromotionDetailModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.endDate,
    required this.price,
    required this.point,
  });
}

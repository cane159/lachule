class ProductDetailModel extends Object {
  final String id;
  final String title;
  final String image;
  final String description;
  final String specifications;
  final String howToUse;
  final String tag;
  final double price;
  final int point;
  ProductDetailModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.specifications,
    required this.howToUse,
    required this.tag,
    required this.price,
    required this.point,
  });
}

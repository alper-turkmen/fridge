class ProductModel {
  final String productName, imgUrl;
  final double calori;
  final int isEatType;
  final double amount;
  final String unit;
  final String category;
  ProductModel({
    required this.productName,
    required this.imgUrl,
    required this.calori,
    required this.isEatType,
    required this.amount,
    required this.unit,
    required this.category
  });
}

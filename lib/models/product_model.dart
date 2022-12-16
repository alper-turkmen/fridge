import 'dart:ffi';

class ProductModel {
  final String productName, immgUrl;
  final int calori, isEatType;
  final double amount;
  ProductModel({
    required this.productName,
    required this.immgUrl,
    required this.calori,
    required this.isEatType,
    required this.amount,
  });
}

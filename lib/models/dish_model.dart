class DishModel {
  final String dishName, imgUrl;
  final double calorie;
  final String isEatType;
  final List<String> material;
  DishModel({
    required this.dishName,
    required this.imgUrl,
    required this.calorie,
    required this.isEatType,
    required this.material
  });
}

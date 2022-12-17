class DishModel {
  final String dishName, imgUrl;
  final double calorie;
  final String isEatType;
  final String portion;
  final String recipe;
  final List<String> material;
  DishModel(
      {required this.dishName,
      required this.imgUrl,
      required this.calorie,
      required this.portion,
      required this.isEatType,
      required this.recipe,
      required this.material});
}

import 'package:fridge/models/dish_model.dart';

import '../models/product_model.dart';

class Dishlist {
  static List<DishModel> dishes = [
      DishModel(dishName: "Rice", imgUrl: "", calorie: 400, isEatType: "All", material: ['Rice', 'Butter', 'Liquid Oil']),
      DishModel(dishName: "Steak House", imgUrl: "", calorie: 1000, isEatType: "Normal", material: ['Meat', 'Garlic', 'Onion', 'Thyme']),
      DishModel(dishName: "Vegetarian Fried Vegetables", imgUrl: "", calorie: 400, isEatType: "Vegetarian", material: ['Tomatoes', 'Onion', 'Red Pepper', 'Mushroom', 'Liquid Oil']),
      DishModel(dishName: "Fried Chicken", imgUrl: "", calorie: 400, isEatType: "Normal", material: ['Chicken', 'Olive Oil', 'Red Pepper']),
      DishModel(dishName: "Mixed Pizza", imgUrl: "", calorie: 400, isEatType: "Normal", material: ['Sujuk', 'Sausage', 'Tomatoes', 'Red Pepper', 'Cheese', 'Pastry']),

  ];
}

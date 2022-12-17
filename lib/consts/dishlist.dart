import 'package:fridge/models/dish_model.dart';

import '../models/product_model.dart';

class Dishlist {
  static List<DishModel> dishes = [
      DishModel(portion:"2 portion", recipe:"Chorizo sausage comes from Spain and has a smoked paprika flavour. You can use a handful of pork or chicken instead – cook for 5 mins with 1 tsp smoked paprika before adding the rice.", dishName: "Rice", imgUrl: "https://i.hizliresim.com/gwy18bv.png", calorie: 400, isEatType: "All", material: ['Rice', 'Butter', 'Liquid Oil']),
      DishModel(portion:"1 portion", recipe:"Chorizo sausage comes from Spain and has a smoked paprika flavour. You can use a handful of pork or chicken instead – cook for 5 mins with 1 tsp smoked paprika before adding the rice.",  dishName: "Steak House", imgUrl: "https://i.hizliresim.com/gl2ixph.png", calorie: 1000, isEatType: "Normal", material: ['Meat', 'Garlic', 'Onion', 'Thyme']),
      DishModel(portion:"3 portion", recipe:"Chorizo sausage comes from Spain and has a smoked paprika flavour. You can use a handful of pork or chicken instead – cook for 5 mins with 1 tsp smoked paprika before adding the rice.",  dishName: "Vegetarian Fried Vegetables", imgUrl: "https://i.hizliresim.com/865ga47.png", calorie: 400, isEatType: "Vegetarian", material: ['Tomatoes', 'Onion', 'Red Pepper', 'Mushroom', 'Liquid Oil']),
      DishModel(portion:"2 portion", recipe:"", dishName: "Fried Chicken", imgUrl: "", calorie: 400, isEatType: "Normal", material: ['Chicken', 'Olive Oil', 'Red Pepper']),
      DishModel(portion:"2 portion", recipe:"", dishName: "Mixed Pizza", imgUrl: "", calorie: 400, isEatType: "Normal", material: ['Sujuk', 'Sausage', 'Tomatoes', 'Red Pepper', 'Cheese', 'Pastry']),

  ];
}

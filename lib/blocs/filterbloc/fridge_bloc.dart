import 'package:bloc/bloc.dart';
import 'package:fridge/blocs/filterbloc/fridge_events.dart';
import 'package:fridge/blocs/filterbloc/fridge_states.dart';
import 'package:fridge/consts/itemlist.dart';
import 'package:fridge/models/product_model.dart';

class FridgeBloc extends Bloc<FridgeEvents, FridgeStates> {
  FridgeBloc() : super(ReturnFridge());
  @override
  String currentTab = "All";

  List<ProductModel> firstItems = [
    ProductModel(
        productName: "Broccoli",
        imgUrl:
        "https://i.hizliresim.com/orlfz1o.png",
        calori: 100,
        isEatType: 0,
        amount: 4,
        unit: "kg",
        category: 'Vegetable'),
    ProductModel(
        productName: "Tomatoes",
        imgUrl:
        "https://i.hizliresim.com/ikwicr2.png",
        calori: 100,
        isEatType: 0,
        amount: 4,
        unit: "kg",
        category: 'Vegetable'),
    ProductModel(
        productName: "Egg",
        imgUrl:
        "http://atlas-content-cdn.pixelsquid.com/stock-images/animal-egg-x7O64d1-600.jpg",
        calori: 100,
        isEatType: 0,
        amount: 4,
        unit: "piece",
        category: 'Other'),
    ProductModel(
        productName: "Milk",
        imgUrl:
        "https://i.hizliresim.com/lwupl1i.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "ml",
        category: 'Dairy'),
    ProductModel(
        productName: "Oil",
        imgUrl:
        "https://i.hizliresim.com/d4alt4g.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "ml",
        category: 'Other'),
    ProductModel(
        productName: "Salt",
        imgUrl:
        "https://i.hizliresim.com/sxtb7x4.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Spice'),

    ////////////

    ProductModel(
        productName: "Rice",
        imgUrl:
        "https://i.hizliresim.com/u9tq7g6.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Legume'),

    ProductModel(
        productName: "Butter",
        imgUrl:
        "https://i.hizliresim.com/7k89k1v.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Dairy'),

    ProductModel(
        productName: "Liquid Oil",
        imgUrl:
        "https://i.hizliresim.com/d4alt4g.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "ml",
        category: 'Oil'),

    ProductModel(
        productName: "Meat",
        imgUrl:
        "https://i.hizliresim.com/qbjz3vy.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Meat'),

    ProductModel(
        productName: "Garlic",
        imgUrl:
        "https://i.hizliresim.com/nrljcru.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Vegetable'),

    ProductModel(
        productName: "Onion",
        imgUrl:
        "https://i.hizliresim.com/8i1uwtv.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Vegetable'),

    ProductModel(
        productName: "Thyme",
        imgUrl:
        "https://i.hizliresim.com/axfbi8l.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Spice'),

    ProductModel(
        productName: "Red Pepper",
        imgUrl:
        "https://i.hizliresim.com/5vphaes.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Vegetable'),

    ProductModel(
        productName: "Mushroom",
        imgUrl:
        "https://i.hizliresim.com/cuag97o.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Other'),


    ProductModel(
        productName: "Sucuk",
        imgUrl:
        "https://i.hizliresim.com/qcveblm.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Meat'),

    ProductModel(
        productName: "Sausage",
        imgUrl:
        "https://i.hizliresim.com/ph4g1f9.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Meat'),

    ProductModel(
        productName: "Pastry",
        imgUrl:
        "https://i.hizliresim.com/j8jfq6b.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Other'),

    ProductModel(
        productName: "Olive Oil",
        imgUrl:
        "https://i.hizliresim.com/mgx1rrq.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "ml",
        category: 'Oil'),

    ProductModel(
        productName: "Chees",
        imgUrl:
        "https://i.hizliresim.com/j8qypu1.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Dairy'),
  ];

  void setTab(String tab) {
    List<ProductModel> temp = [];
    currentTab = tab;
    for (int i = 0; i < firstItems.length; i++) {
      if (currentTab == "All") {
        temp.add(firstItems[i]);
      } else {
        if (firstItems[i].category == tab) {
          temp.add(firstItems[i]);
        }
      }
    }
    items = temp;
  }

  List<ProductModel> items = [];

  Stream<FridgeStates> mapEventToState(FridgeEvents event) async* {
    items = firstItems;
    if (event is GoFridge) {
      yield ReturnFridge();
    }
  }
}

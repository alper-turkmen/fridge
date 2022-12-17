import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../blocs/filterbloc/fridge_bloc.dart';
import '../../consts/consts.dart';
import '../../models/product_model.dart';

class FromReceipt extends StatefulWidget {
  const FromReceipt({Key? key}) : super(key: key);

  @override
  State<FromReceipt> createState() => _FromReceiptState();
}

class _FromReceiptState extends State<FromReceipt> {
  bool isLoaded = false;

  int currentPage = 0;
  void changePage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Great!",
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0)),
                    ),
                    child: Text(
                      "You have successfully added material",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.check,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Okay",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          color: ColorList.mainColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void initState() {
    super.initState();

    checkPossibleDishes();
  }

  void checkPossibleDishes() {
    for (int i = 0; i < 3; i++) {}
    setState(() {
      isLoaded = true;
    });
  }

  final List<String> listItems = [
    'Rice',
    'Butter',
    'Chicken',
  ];

  final List<ProductModel> newProducts = [
    ProductModel(
        productName: "Ice Cream",
        imgUrl:
            "https://w7.pngwing.com/pngs/635/1022/png-transparent-blue-ceramic-bowl-with-ice-cream-in-it-chocolate-ice-cream-milkshake-ice-cream-cone-ice-cream-free-cream-food-free-logo-design-template-thumbnail.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Meat'),
    ProductModel(
        productName: "Yogurt",
        imgUrl:
            "https://toppng.com/uploads/preview/yogurt-dish-11538606117g359hplbdy.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Meat'),
    ProductModel(
        productName: "Water",
        imgUrl:
            "https://e7.pngegg.com/pngimages/557/35/png-clipart-bowl-of-white-cream-ice-cream-frozen-yogurt-milk-yoghurt-breakfast-yogurt-cream-food.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Other'),
    ProductModel(
        productName: "Chocolate",
        imgUrl:
            "https://e7.pngegg.com/pngimages/557/35/png-clipart-bowl-of-white-cream-ice-cream-frozen-yogurt-milk-yoghurt-breakfast-yogurt-cream-food.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Snacks'),
    ProductModel(
        productName: "Chips",
        imgUrl:
            "https://e7.pngegg.com/pngimages/557/35/png-clipart-bowl-of-white-cream-ice-cream-frozen-yogurt-milk-yoghurt-breakfast-yogurt-cream-food.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Snacks'),
    ProductModel(
        productName: "Coke",
        imgUrl:
            "https://e7.pngegg.com/pngimages/557/35/png-clipart-bowl-of-white-cream-ice-cream-frozen-yogurt-milk-yoghurt-breakfast-yogurt-cream-food.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Drink'),
    ProductModel(
        productName: "Ayran",
        imgUrl:
            "https://e7.pngegg.com/pngimages/557/35/png-clipart-bowl-of-white-cream-ice-cream-frozen-yogurt-milk-yoghurt-breakfast-yogurt-cream-food.png",
        calori: 100,
        isEatType: 0,
        amount: 1000,
        unit: "gr",
        category: 'Meat'),
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset("assets/cam1.jpg")),
        ],
    );
  }
}

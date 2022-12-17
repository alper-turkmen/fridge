import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/blocs/filterbloc/fridge_bloc.dart';

import '../consts/consts.dart';
import '../models/product_model.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  bool isLoaded = false;

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
            "https://e7.pngegg.com/pngimages/557/35/png-clipart-bowl-of-white-cream-ice-cream-frozen-yogurt-milk-yoghurt-breakfast-yogurt-cream-food.png",
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        size: 36,
                      )),
                ),
                Material(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.search,
                          size: 26,
                        ),
                      )),
                ),
              ],
            ),
            isLoaded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onPressed: () {
                              openAlertBox();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.add,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Add to Fridge",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            color: ColorList.mainColor,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onPressed: () {
                              openAlertBox();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.add,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Add to Fridge",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            color: ColorList.mainColor,
                          ),
                        ],
                      ),
                      Text(
                        "Add to Fridge or Pantry",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      DropdownButtonFormField2(
                        focusColor: Colors.green,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Select Material to Add',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: newProducts
                            .map((item) => DropdownMenuItem<String>(
                                  value: item.productName,
                                  child: Text(
                                    item.productName,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select material.';
                          }
                        },
                        onChanged: (value) {
                          selectedValue = value;
                          for (int i = 0; i < newProducts.length; i++) {
                            if (newProducts[i].productName == selectedValue) {
                              BlocProvider.of<FridgeBloc>(context)
                                  .firstItems
                                  .insert(0, newProducts[i]);
                            }
                          }
                        },
                        onSaved: (value) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onPressed: () {
                              openAlertBox();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.add,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Add to Fridge",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            color: ColorList.mainColor,
                          ),
                        ],
                      ),
                    ],
                  )
                : CircularProgressIndicator(),
          ],
        ),
      )),
    );
  }
}

class DishCard extends StatelessWidget {
  const DishCard({
    Key? key,
    required this.dishName,
    required this.amount,
    required this.imgUrl,
    required this.unit,
  }) : super(key: key);
  final String dishName;
  final String amount;
  final String unit;

  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(height: 75, width: 75, child: Image.network(imgUrl)),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dishName),
                  Text(amount),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

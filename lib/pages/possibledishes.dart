import 'package:flutter/material.dart';
import 'package:fridge/consts/dishlist.dart';
import 'package:fridge/consts/itemlist.dart';
import 'package:fridge/models/dish_model.dart';
import 'package:fridge/pages/ivertory.dart';
import 'package:fridge/pages/recipe.dart';

class PossibleDishes extends StatefulWidget {
  const PossibleDishes({Key? key}) : super(key: key);

  @override
  State<PossibleDishes> createState() => _PossibleDishesState();
}

class _PossibleDishesState extends State<PossibleDishes> {
  bool isLoaded = false;

  void initState() {
    super.initState();

    checkPossibleDishes();
  }

  List<DishModel> dishes = [];

  void checkPossibleDishes() {
    for (int i = 0; i < 3; i++) {
      dishes.add(Dishlist.dishes[i]);
    }
    setState(() {
      isLoaded = true;
    });
/*
    for (int i = 0; i < Dishlist.dishes.length; i++) {
      bool isPossible = true;

      for (int j = 0; j < ItemList.items.length; j++) {

        for (int k = 0; k < Dishlist.dishes[i].material.length; k++) {
          if (ItemList.items[j].productName == Dishlist.dishes[i].material[k]) {
            print("yes");
            isPossible = true;
          }else{
            print("no");
            isPossible = false;
            break;
          }
        }
      }

      if (isPossible) {
        dishes.add(Dishlist.dishes[i]);
      }


    }
    print(dishes);
    setState(() {
      isLoaded = true;
    });
*/

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
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
                // IconButton(onPressed: (){}, icon: Icon(Icons.chevron_left_outlined,color: Colors.black,))
              ],
            ),
            isLoaded
                ? Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Meals that can be made",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: dishes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DishCard(
                                recipe: dishes[index].recipe,
                                unit: "adet",
                                imgUrl:dishes[index].imgUrl,
                                dishName: dishes[index].dishName,
                                amount: dishes[index].portion);
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: SizedBox(
                          width: 400.1,
                          height: 50.1,
                          child: customProjectButton(
                            nextPageName: Inventory(),
                            buttonText: "Go to Fridge",
                          ),
                        ),
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
    required this.recipe,
    required this.dishName,
    required this.amount,
    required this.imgUrl,
    required this.unit,
  }) : super(key: key);
  final String dishName;
  final String recipe;
  final String amount;
  final String unit;

  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Recipe(name: dishName, recipe: recipe, url:imgUrl)),
        );
      },
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

class customProjectButton extends StatelessWidget {
  const customProjectButton({
    Key? key,
    required this.buttonText,
    required this.nextPageName,
  }) : super(key: key);
  final String buttonText;
  final Widget nextPageName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => nextPageName));
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF43B658), // background (button) color
          foregroundColor: Colors.white, // foreground (text) color
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Text(buttonText,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white)),
    );
  }
}

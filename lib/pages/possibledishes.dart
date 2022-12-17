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
    for (int i = 0; i < Dishlist.dishes.length; i++) {
      bool isPossible = false;
      for (int j = 0; j < Dishlist.dishes[i].material.length; j++) {
        for (int k = 0; k < ItemList.items.length; k++) {
          if (ItemList.items[k].productName == Dishlist.dishes[i].material[j]) {
            print("yes");
          }else{
            print("no");
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                unit: "adet",
                                imgUrl:
                                    "https://www.freepnglogos.com/uploads/pasta-png/pasta-seasonings-product-poddar-foods-13.png",
                                dishName: dishes[index].dishName,
                                amount: "2 portion");
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Recipe()),
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

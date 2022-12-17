import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/blocs/filterbloc/fridge_bloc.dart';
import 'package:fridge/blocs/filterbloc/fridge_events.dart';
import 'package:fridge/blocs/filterbloc/fridge_states.dart';
import 'package:fridge/consts/itemlist.dart';
import 'package:fridge/models/product_model.dart';

import '../consts/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  bool isLoaded = false;

  void initState() {
    super.initState();
    setTab("All");
    setState(() {
      isLoaded = true;
    });
  }

  String currentTab = "All";
  List items = [];

  void setTab(String tab) {
    currentTab = tab;
    List<ProductModel> temp = [];

    for (int i = 0;
        i < BlocProvider.of<FridgeBloc>(context).items.length;
        i++) {
      if (currentTab == "All") {
        temp.add(BlocProvider.of<FridgeBloc>(context).items[i]);
      } else {
        if (BlocProvider.of<FridgeBloc>(context).items[i].category == tab) {
          temp.add(BlocProvider.of<FridgeBloc>(context).items[i]);
        }
      }
    }
    setState(() {
      items = temp;
    });
  }

  void test(String tab) {
    BlocProvider.of<FridgeBloc>(context).setTab(tab);
    setState(() {});
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.kitchen,
                          size: 26,
                          color: Colors.white,
                        ),
                      )),
                  Center(child: Text('Fridge', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),)),
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
                            Icons.kitchen,
                            size: 26,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: width,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: width * .9,
                        height: height * .20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            pageSnapping: true,
                            itemCount: 3,
                            onPageChanged: (page) {
                              setState(() {});
                            },
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(0.1),
                                          BlendMode.dstATop),
                                      image: new NetworkImage(
                                        'https://w7.pngwing.com/pngs/673/391/png-transparent-graphy-vegetable-fruit-basket-of-vegetables-natural-foods-leaf-vegetable-food-thumbnail.png',
                                      ),
                                    ),
                                    color: ColorList.secondGreen,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Text(
                                          'Hello, \nWhat would you like to\nprepare today?',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        left: 20,
                                        top: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryCard(text: "All", callback: () => test("All")),
                        CategoryCard(
                            text: "Vegetable",
                            callback: () => test("Vegetable")),
                        CategoryCard(
                            text: "Dairy", callback: () => test("Dairy")),
                        CategoryCard(
                            text: "Meat", callback: () => test("Meat")),
                        CategoryCard(text: "Oil", callback: () => test("Oil")),
                        CategoryCard(
                            text: "Spice", callback: () => test("Spice")),
                        CategoryCard(
                            text: "Legume", callback: () => test("Legume")),
                        CategoryCard(
                            text: "Other", callback: () => test("Other")),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isLoaded
                      ? BlocBuilder<FridgeBloc, FridgeStates>(
                          builder: (context, state) {
                          return (GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: BlocProvider.of<FridgeBloc>(context)
                                .items
                                .length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 1.4,
                                    crossAxisSpacing: 15.0,
                                    mainAxisSpacing: 20.0),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 160,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: NetworkImage(
                                              BlocProvider.of<FridgeBloc>(
                                                      context)
                                                  .items[index]
                                                  .imgUrl,
                                            ),
                                          )),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(BlocProvider.of<FridgeBloc>(
                                                  context)
                                              .items[index]
                                              .productName),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${BlocProvider.of<FridgeBloc>(context).items[index].amount} ${BlocProvider.of<FridgeBloc>(context).items[index].unit} left",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: ColorList.mainColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ));
                        })
                      : CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),


  ]),

        )])));
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({required this.text, required this.callback});
  String text;
  void Function() callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: EdgeInsets.only(right: 3),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(text)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

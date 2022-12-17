import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  void setTab(String tab){
    currentTab = tab;
    List<ProductModel> temp = [];

    for(int i = 0; i < ItemList.items.length; i++){
      if(currentTab == "All"){
          temp.add(ItemList.items[i]);
      }else{
        if(ItemList.items[i].category == tab){
          temp.add(ItemList.items[i]);
        }
      }
    }
    setState(() {
      items = temp;
    });

  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                  child: Row(children: [
                  CategoryCard(text: "All", callback: () => setTab("All")),
                  CategoryCard(text: "Vegetables", callback: () => setTab("Vegetables")),
                  CategoryCard(text: "Dairy", callback: () => setTab("Dairy")),
                  CategoryCard(text: "Meat", callback: () => setTab("Meat")),
                  CategoryCard(text: "Oil", callback: () => setTab("Oil")),
                  CategoryCard(text: "Spice", callback: () => setTab("Spice")),
                  CategoryCard(text: "Legume", callback: () => setTab("Legume")),
                  CategoryCard(text: "Other", callback: () => setTab("Other")),

                ],),),
                SizedBox(
                  height: 20,
                ),
               isLoaded ? GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 160,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        items[index].imgUrl,
                                      ),
                                    )
                                ),

                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(items[index].productName),
                                SizedBox(height: 5,),
                                Text(
                                  "${items[index].amount} ${items[index].unit} left",
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
                ) : CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {},
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
                            "Add to Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      color: ColorList.mainColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side:
                            BorderSide(width: 1.0, color: ColorList.mainColor),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.trash,
                            color: ColorList.mainColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Remove")
                        ],
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
              Container(  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(text)),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

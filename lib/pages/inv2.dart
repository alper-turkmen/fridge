import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/consts/itemlist.dart';

import '../consts/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double overflowWidth = MediaQuery.of(context).size.width;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<Widget> indicators(imagesLength, currentIndex) {
      return List<Widget>.generate(imagesLength, (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: currentIndex == index
                  ? ColorList.mainColor
                  : ColorList.secondColor,
              shape: BoxShape.circle),
        );
      });
    }

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
                GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ItemList.items.length,

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
                          width: 1,
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
                                       ItemList.items[index].imgUrl,
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
                                Text(ItemList.items[index].productName),
                                SizedBox(height: 5,),
                                Text(
                                  "${ItemList.items[index].amount} ${ItemList.items[index].unit} left",
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
                ),
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

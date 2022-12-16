import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts/consts.dart';
import 'inv2.dart';

class Inventory extends StatefulWidget {
  Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget selectedWidget = HomePage();
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    AppBar appBar = AppBar();
    return Scaffold(
      key: _scaffoldKey,

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => _scaffoldKey.currentState!.openDrawer(),
                child: Icon(Icons.menu)
              ),


            ],
          ),
          backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            elevation: 8,
            backgroundColor: ColorList.mainColor,
            onPressed: () {
              setState(() {

                selectedPage = 5;
              });
            },
            child: Icon(Icons.add)
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: selectedWidget,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedPage = 0;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.list,
                      color:
                      selectedPage == 0 ? ColorList.mainColor : Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    selectedPage == 0
                        ? Text(
                      "Fridge",
                      style: TextStyle(
                        fontSize: 13,
                        color: selectedPage == 0
                            ? ColorList.mainColor
                            : Colors.grey,
                      ),
                    )
                        : SizedBox(),
                  ],
                ),
              ),
            ),



            InkWell(
              onTap: () {
                setState(() {

                  selectedPage = 3;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.bookmark,
                      color:
                      selectedPage == 3 ? ColorList.mainColor : Colors.grey,
                    ),

                    selectedPage == 3
                        ? Text(
                      "Recipes",
                      style: TextStyle(
                        fontSize: 13,
                        color: selectedPage == 3
                            ? ColorList.mainColor
                            : Colors.grey,
                      ),
                    )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CenterMenuOption extends StatelessWidget {
  CenterMenuOption(
      {Key? key,
        required this.height,
        required this.width,
        required this.image,
        required this.text})
      : super(key: key);

  final double height;
  final double width;
  String text;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorList.secondColor,
        borderRadius: BorderRadius.circular(15),
      ),
      height: height * 0.12,
      width: width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            height: height * 0.05,
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: ColorList.mainColor),
          ),
        ],
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  String text;
  IconData icon;
  bool isSelected;
  void Function() func;
  BottomBarIcon(
      {Key? key,
        required this.text,
        required this.icon,
        required this.isSelected,
        required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? ColorList.mainColor : Colors.grey,
            ),
            isSelected
                ? Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: isSelected ? ColorList.mainColor : Colors.grey,
              ),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

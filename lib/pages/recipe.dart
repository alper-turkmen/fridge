import 'package:flutter/material.dart';
import 'package:fridge/pages/ivertory.dart';

class Recipe extends StatefulWidget {
  const Recipe({Key? key}) : super(key: key);

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  String textData =
      "Lorem ıpsum simply text of the printing  and typesetting industry. Lorem Ipum has been the standart Dummy text ever sinc the 1500s";

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
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                )
                // IconButton(onPressed: (){}, icon: Icon(Icons.chevron_left_outlined,color: Colors.black,))
              ],
            ),
            Container(width: 500, height: 250, child: Image.network("https://i.hizliresim.com/bruayqa.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Green Broccoli",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pişirme Süresi: 18 dk  "),
                    Text("210 kalori"),
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.pause_circle_sharp)),
                        Text("1Kg"),
                        IconButton(onPressed: () {}, icon: Icon(Icons.pause_circle_sharp)),
                      ],
                    )
                  ],
                ),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(textData),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Related Item",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Row(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Container(
                              height: 50, width: 50, child: Image.network("https://i.hizliresim.com/bruayqa.png")),
                          Text("domates")
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  child: const SizedBox(
                    width: 400.1,
                    height: 50.1,
                    child: customProjectButton(
                      nextPageName: Inventory(),
                      buttonText: "Add To Cart",
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextPageName));
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF43B658), // background (button) color
          foregroundColor: Colors.white, // foreground (text) color
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Text(buttonText, style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white)),
    );
  }
}

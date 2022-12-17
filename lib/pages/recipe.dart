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
                // Container(
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.white,
                //   ),
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.chevron_left,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
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
            Container(
                width: 400,
                height: 200,
                child: Image.network("https://e7.pngegg.com/pngimages/822/65/png-clipart-pasta-pasta-thumbnail.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Pasta",
                  style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pişirme Süresi: 18 dk",
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    Text(
                      "210 kalori",
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.remove_circle),
                          color: Colors.red,
                        ),
                        Text("1"),
                        Text("P"),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.w600),
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
                  style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.w600),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FoodCard(
                          unit: "adet",
                          imgUrl: "https://i.hizliresim.com/bruayqa.png",
                          productName: "Tomatos",
                          amount: "8 tane"),
                      FoodCard(
                          unit: "adet",
                          imgUrl: "https://img.freepik.com/premium-vector/potatoes-realistic_1268-12403.jpg",
                          productName: "Patato",
                          amount: "6 tane"),
                      FoodCard(
                          unit: "adet",
                          imgUrl: "https://www.pngkit.com/png/detail/43-430124_pasta-png-transparent-pasta-png.png",
                          productName: "Pasta",
                          amount: "1 Paket"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
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

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
    required this.productName,
    required this.amount,
    required this.imgUrl,
    required this.unit,
  }) : super(key: key);
  final String productName;
  final String amount;
  final String unit;

  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(height: 75, width: 75, child: Image.network(imgUrl)),
          Text(productName),
          Text(amount),
        ],
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

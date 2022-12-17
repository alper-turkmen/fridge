import 'package:flutter/material.dart';
import 'package:fridge/blocs/filterbloc/fridge_bloc.dart';
import 'package:fridge/blocs/filterbloc/fridge_events.dart';
import 'package:fridge/pages/cart.dart';
import 'package:fridge/pages/ivertory.dart';
import 'package:fridge/pages/login_page.dart';
import 'package:fridge/pages/possibledishes.dart';
import 'package:fridge/pages/recipe.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge/splash/splash.dart';

void main() {
  runApp(BlocProvider(
      create: (_) => FridgeBloc()
        ..add(
          GoFridge(),
        ),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fridge App',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inventory()),
                );
              },
              child: Text('inventory'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
              child: Text('cart'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Recipe()),
                );
              },
              child: Text('recipe'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PossibleDishes()),
                );
              },
              child: Text('possible dishes'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Text('Login Page'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

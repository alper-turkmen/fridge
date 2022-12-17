import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String logoPATH = 'asset/images/logo.png';
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

// Text("Fluevent", style: Theme.of(context).textTheme.headline6),),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_iawwfiag.json'),
    ));
  }
}

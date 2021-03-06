import 'package:asdl/screens/checkout_screen.dart';
import 'package:asdl/screens/home_screen.dart';
import 'package:asdl/screens/landing_page.dart';
import 'package:asdl/screens/login.dart';
import 'package:flutter/material.dart';
import './movienames.dart';

void main() {
  runApp(MyApp(

  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASDL',
      debugShowCheckedModeBanner: false,
      initialRoute: loginScreen.id,
      routes: {
        homePage.id:(context) => homePage(),
        loginScreen.id:(context) => loginScreen(onSignIn: null,),
        landingPage.id:(context) => landingPage(),
        CheckoutScreen.id:(context) => CheckoutScreen(),
//        onBoardingMobile.id:(context) => onBoardingMobile(),
      },
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/adminHome.dart';
import 'package:schoolapp/home_screen.dart';
import 'package:schoolapp/login.dart';
import 'package:schoolapp/student.dart';
import 'donate.dart';
import 'onBoarding.dart';

 extension ColorExtension on String { toColor() { var hexString = this; final buffer = StringBuffer(); if (hexString.length == 6 || hexString.length == 7) buffer.write('ff'); buffer.write(hexString.replaceFirst('#', '')); return Color(int.parse(buffer.toString(), radix: 16)); } }
Map<int, Color> color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};

 MaterialColor colorCustom = MaterialColor(0xFF364F6B, color);



//0xFF880E4F
Future main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In Our Eyes',
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
        primarySwatch:colorCustom,
        //'#3FC1C9'.toColor(),
       scaffoldBackgroundColor: Colors.white,
      ),
    //   home:
     initialRoute: OnBoardingScreen.OnBoardingScreenRoute,
      routes: {
        OnBoardingScreen.OnBoardingScreenRoute: (context) => OnBoardingScreen(),
        HomeScreen.homeScreenRoute :(context) =>HomeScreen(),
        adminHomeScreen.adminhomeScreenRoute :(context) =>adminHomeScreen(),
        donateScreen.donateScreenRoute :(context) => donateScreen(),
        studentinfo.studentinfoRoute :(context) => studentinfo(),
        logInScreen.logInScreenRoute :(context) =>logInScreen(),

      },
    );
  }
}




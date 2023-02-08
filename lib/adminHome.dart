







import 'package:flutter/material.dart';
import 'package:schoolapp/data.dart';
import 'package:schoolapp/studentsData.dart';

import 'shared.dart';


class adminHomeScreen extends StatelessWidget
{
  static const String adminhomeScreenRoute ='adminHomeScreen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'إنك بأعيننا',
          style: TextStyle(
            fontFamily: 'ReemKufi',
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 150,
        toolbarOpacity: 0.9,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(60),
              bottomLeft: Radius.circular(60)),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top:250),
        child: SingleChildScrollView(

          child: Center(
            child: Column(


              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,//spaceBetween,
                    children: [
                      MyButtonForHome(iconImagePath:'Images/plugin.png', buttonText:'احتياج',onPress: (){Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => studentsNotification()));
                      },
                      ),
                      MyButtonForHome(iconImagePath:'Images/donate.png', buttonText:    'متبرعين',onPress: (){Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => customerNotification()));},),
                    ],
                  ),
                ),
                    ],
                  ),
          ),
              ),


));




  }}
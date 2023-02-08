
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/donate.dart';
import 'package:schoolapp/login.dart';
import 'package:schoolapp/onBoarding.dart';
import 'package:schoolapp/shared.dart';
import 'package:schoolapp/student.dart';

class HomeScreen extends StatelessWidget
{
  static const String homeScreenRoute ='HomeScreen';

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
        padding: const EdgeInsets.only(top:20),
        child: SingleChildScrollView(

          child: Column(
            children: [
              Column(

                children: [
                  SizedBox(height: 20,),
                  Container(
                    height:150,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2,
                            spreadRadius: 2,
                          )
                        ]
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Expanded(
                            child: Column(
                                children:[
                                  Row(

                                    children: [

                                      SizedBox(width: 70,),

                                      Text(
                                        'ضع بصمتك واصنع تغيير',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Lateef',
                                          fontSize: 30,
                                        ),
                                      ),

                                      SizedBox(width: 5,),
                                      Icon(Icons.fingerprint ),
                                      SizedBox(width:20),
                                    ],
                                  ),
                                  Row(
                                    children:
                                    [
                                      SizedBox(width:20),
                                      Expanded(

                                        child: Text(
                                          'فئات مجتمعنا المحلي بحاجة لكثير من الدعم '
                                              'والمدارس وطلابها وطالباتها أهم هذه الفئات',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 20,
                                          style: TextStyle(
                                            fontFamily: 'Lateef',
                                            fontSize: 23,
                                          ),
                                        ),
                                      ),
                                    ]
                                    ,),
                                ]
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 55.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,//spaceBetween,
                 children: [
                   MyButtonForHome(iconImagePath:'Images/flower_pot.png', buttonText:'تبرع',onPress: (){Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => donateScreen()));
                   },
                       ),
                   MyButtonForHome(iconImagePath:'Images/puzzle.png', buttonText:    'احتياج',onPress: (){Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => studentinfo()));},),
                 ],
               ),
             ),
              SizedBox(height: 25,),
              Container(
                height:80,
                 padding: EdgeInsets.all(9),

                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ]
                ),
                child:Column(

                    children: [

                      const Text(
                          "قال تعالى: (وَقُلِ اعْمَلُوا فَسَيَرَى اللَّهُ عَمَلَكُمْ وَرَسُولُهُ وَالْمُؤْمِنُونَ) ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lateef',
                            fontSize: 23,
                          )
                      ),
                      const Text(
                          " [التوبة:105]",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Lateef',
                            fontSize: 15,
                          )
                      ),
                    ],
                  ),
                ) ,
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(countneeders.toString(),

                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lateef',
                                  fontSize: 35,)

                              ),
                              Text('شخص بحاجة للمساعدة',
                                textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Lateef',
                                    fontSize: 22,
                                    color: Colors.grey[900]
                                  )
                              )
                            ],
                          ),
                          Container(
                            height: 60,
                            child: Image.asset('Images/plugin.png',),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(countneeders.toString(),

                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lateef',
                                  fontSize: 35,)

                            ),
                            Text('شخص قد تبرع',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Lateef',
                                    fontSize: 22,
                                    color: Colors.grey[900]
                                )
                            )
                          ],
                        ),
                        Container(
                          height: 60,
                          child: Image.asset('Images/donate.png',),
                        ),
                      ],
                    ),



                  ],
                ),
              ),
              Container(
                height:80,
             padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ]
                ),



                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    TextButton (
                      onPressed : (){
                       Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => logInScreen()));
                      },
                      child: Text(
                        ' اضغط هنا',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Lateef',
                              fontSize: 25,
                          )
                      ),),
                    Text(
                        'هذا الجزء فقط للأدمن',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Lateef',
                            fontSize: 25,
                            color: Colors.grey[900]
                        )
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}
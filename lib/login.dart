import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/shared.dart';

import 'adminHome.dart';
import 'data.dart';
import 'studentsData.dart';

void getStudentsNotifications() {
  snotification.clear();
  FirebaseFirestore.instance.collection('needers').get().then((value) {
    @required  String  sname;
    @required  String sid;
    @required  String sphoneNumber;
    String? school;
    String? sclass;
    String? sage;
    @required  String details;
    value.docs.forEach((element){
      sname=element.data()['name'];
      print(sname);
      sid=element.data()['Id'];
      sphoneNumber=element.data()['phone'];
      print("hello");
      print(element.data()['name']);
      sage=element.data()['age'].toString();
      school=element.data()['schoolName'];
      sclass=element.data()['class'].toString();
      details=element.data()['details'];
      snotification.add( fetchStudentsData_model(sname!, sid!, sphoneNumber!,sage, school, sclass, details!));
      print(snotification);
    });
  }).catchError((error) {print(error);});
}
void getNotifications() {
  notification.clear();
  FirebaseFirestore.instance.collection('donaters').get().then((value) {
    String? name;
    String? address;
    String? phoneNumber;
    String? others;
    String? money;
    String? age;
    String? season;
    String? major;
    String? type;
    value.docs.forEach((element){

      name=element.data()['name'];
      address=element.data()['address'];
      phoneNumber=element.data()['phoneNumber'];
      others=element.data()['others'];
      money=element.data()['money'];
      age=element.data()['age'];
      season=element.data()['season'];
      major=element.data()['major'];
      type=element.data()['type'];
      notification.add(fetchData_model(name!, address!, phoneNumber!, others, money, age, season, major, type));
    });
  }).catchError((error) {});
}

class logInScreen extends StatefulWidget {
  static const String logInScreenRoute = 'logInScreen';
  @override
  _logInScreenState createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();


  _logInScreenState(){
    getStudentsNotifications();
    getNotifications();
  }

  var formKey = GlobalKey<FormState>();

  bool isPasswordShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "Images/helping_hand.png",
                      height: 250.0,
                      width: 250.0,
                    ),
                  ),
                  Center(
                    child: const Text(
                      'إنك بأعيننا',
                      style: TextStyle(
                        fontFamily: 'ReemKufi',
                        fontSize: 50,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0,),
                  defaultFormField(

                    controller: emailController,
                    label: 'البريد الإلكتروني',
                    suffix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0,),
                  defaultFormField(

                    controller: passwordController,
                    label: 'كلمة السر',
                    suffix: Icons.lock,
                    prefix: isPasswordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    type: TextInputType.visiblePassword,
                    isPassword: isPasswordShow,
                    suffixPressed: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    },
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'password is too short';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if((emailController.text == 'rita@admin.com' && passwordController.text == '15963' ) || (emailController.text == '3itaf@admin.com' && passwordController.text == '15963' ) )
                       { Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adminHomeScreen()));
                      }},
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white54,
                        ),
                      ),
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(200, 40)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

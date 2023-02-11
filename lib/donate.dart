import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/onBoarding.dart';



class donateScreen extends StatefulWidget {
  static const String donateScreenRoute ='donateScreen';
   final databaseReference = FirebaseDatabase.instance.reference();
  @override
  _donateScreenState createState() => _donateScreenState();
}

class _donateScreenState extends State<donateScreen> {
  @override
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var othersController = TextEditingController();
  var _courseHelpController = TextEditingController();
  var ageController = TextEditingController();
  var majorController = TextEditingController();
  var typeController =TextEditingController();





  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("غيرها"),value: '1'),
      DropdownMenuItem(child: Text("مواد غذائية"),value: '2'),
      DropdownMenuItem(child: Text("مادة دراسية"),value: '3'),
      DropdownMenuItem(child: Text("ملابس"),value: '4'),
      DropdownMenuItem(child: Text("تطوع خريج"),value: '5'),
    ];
    return menuItems;
  }
  String selectedValue = '1';
  int _clothesgroup = 0 ;

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'معلومات المتبرع',
          style: TextStyle(
            //    fontFamily: 'ReemKufi',
            fontFamily: 'Lateef',
            fontSize: 35,
            //  fontSize: 35,
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
      body:
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top:15),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 30,),
                TextFormField(
                  controller: nameController,
                  textAlign: TextAlign.end,
                  decoration:
                  InputDecoration(
                    hintText: "اسم المتبرع",
                    alignLabelWithHint: true,

                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: addressController,
                  textAlign: TextAlign.end,
                  decoration:
                  InputDecoration(
                    hintText: "عنوان السكن",
                    alignLabelWithHint: true,

                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: phoneNumberController,
                  textAlign: TextAlign.end,
                  decoration:
                  InputDecoration(
                    hintText: "رقم الهاتف",
                    alignLabelWithHint: true,

                  ),
                ),
                SizedBox(height: 15,),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        value: selectedValue,
                        items: dropdownItems,
                        onChanged: (value){
                          setState(() {
                            selectedValue = value.toString() ;
                          });
                        } ,
                      ),
                      SizedBox(width: 30,),

                      Text('نوع التبرع'),


                    ],
                  ),
                ),
                Container(
                  child: selectedValue == '1' ? (
                      TextFormField(
                        textAlign: TextAlign.end,
                        controller: othersController,
                        decoration:
                        InputDecoration(
                          hintText: " ",
                          fillColor: Colors.white,
                          filled: true,

                        ),
                      )
                  )
                      : null ,
                ),
                Container(
                  child: selectedValue == '3' ? (
                      TextFormField(
                        textAlign: TextAlign.end,
                        controller: _courseHelpController,
                        decoration:
                        InputDecoration(
                          hintText: "المادة التي يمكنك تدريسها",
                          fillColor: Colors.white,
                          filled: true,

                        ),
                      )
                  )
                      : null ,
                ),
                Container(
                  child: selectedValue == '4' ? (
                      Column(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.end,
                            controller: ageController,
                            decoration:
                            InputDecoration(
                              hintText: " العمر الذي تناسبه الملابس",
                              fillColor: Colors.white,
                              filled: true,

                            ),
                          ),
                          SizedBox(height: 15,),

                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  title: Text("صيفي"),
                                  value:1 ,
                                  groupValue: _clothesgroup,
                                  onChanged: (value){
                                    setState(() {
                                      _clothesgroup = value as int;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: Text("شتوي"),
                                  value:2 ,
                                  groupValue: _clothesgroup,
                                  onChanged: (value){
                                    setState(() {
                                      _clothesgroup = value as int;
                                    });
                                  },
                                ),
                              )
                            ],
                          )


                        ],
                      )
                  )
                      : null,
                ),
                Container(
                  child: selectedValue == '5' ? (
                      Column(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.end,
                            controller: majorController,
                            decoration:
                            InputDecoration(
                              hintText: "التخصص",
                              fillColor: Colors.white,
                              filled: true,

                            ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                            textAlign: TextAlign.end,
                            controller: typeController,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 50,
                            decoration:
                            InputDecoration(
                              hintMaxLines: 20,
                              hintText: "التطوع الذي بإمكانك تقديمه",
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),


                        ],
                      )
                  )
                      : null,
                ),

                SizedBox(height: 25,),

                ElevatedButton(

                  onPressed: ()async{

                    print(selectedValue);
                    if(selectedValue=="1")
                      await FirebaseFirestore.instance.collection('donaters').add(
                          {'name': nameController.text,'address':addressController.text,'phoneNumber':phoneNumberController.text,'other':othersController.text});
                      else if(selectedValue=="2")
                        await FirebaseFirestore.instance.collection('donaters').add(
                            {'name': nameController.text,'address':addressController.text,'phoneNumber':phoneNumberController.text});
                      else  if(selectedValue=="3")
                        await FirebaseFirestore.instance.collection('donaters').add(
                            {'name': nameController.text,'address':addressController.text,'phoneNumber':phoneNumberController.text,'_courseHelp':_courseHelpController.text});
                      else  if(selectedValue=="4")
                        await FirebaseFirestore.instance.collection('donaters').add(
                            {'name': nameController.text,'address':addressController.text,'phoneNumber':phoneNumberController.text,'age':ageController.text,'session':_clothesgroup==1?'summer':'winter'});
                      else  if(selectedValue=="5")
                        await FirebaseFirestore.instance.collection('donaters').add(
                            {'name': nameController.text,'address':addressController.text,'phoneNumber':phoneNumberController.text,'major':majorController.text,'type':typeController.text});
                       getCountsOfDonaters();
                      },
                  child:  Text('إرسال المعلومات',
                    style: TextStyle(
                      fontSize: 20.0,
                      color:Colors.white,
                    ),
                  ) ,
                  style:
                  ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(200, 40)),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.white54;
                        return null; // Defer to the widget's default.
                      },
                    ),

                  ),
                ),























              ],
            ),
          ),
        ),

      ),

    );
  }
}
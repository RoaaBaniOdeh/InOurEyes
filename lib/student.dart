
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/onBoarding.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class studentinfo extends StatefulWidget {
  static const String studentinfoRoute ='studentinfo';
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  _studentinfoState createState() => _studentinfoState();
}

class _studentinfoState extends State<studentinfo> {
  int currentStep=0;
  int age=5;
  int sclass=1;
  var nameController = TextEditingController();
  var idController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var schoolNameController = TextEditingController();
  var detailsOfNeedController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
        body:Stepper(

          controlsBuilder:(BuildContext context, ControlsDetails details) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    style:  TextButton.styleFrom(primary:Colors.black ),
                    onPressed:  currentStep !=2?details.onStepContinue:()async{

                    await FirebaseFirestore.instance.collection('needers').add(
                  {'name': nameController.text,'phone':phoneNumberController.text,'Id':idController.text,'schoolName':schoolNameController.text,'age':age,'class':sclass,'details':detailsOfNeedController.text});
                    getCountsOfneeders();
                   },
                    child: currentStep!=2? Text('التالي'):Text('ارسال المعلومات'),
                  ),
                ),
                SizedBox(width:10,),
                Expanded(
                  child:TextButton(
                    style:  TextButton.styleFrom(primary:Colors.black ),
                    onPressed: details.onStepCancel,
                    child: currentStep!=0? Text('الرجوع للخلف'):Text('الغاء'),
                ),),
              ],
            );
          } ,
          currentStep: currentStep,
          onStepContinue: (){

            if(currentStep!=2)
              setState(()=>{currentStep++});

            },
          onStepCancel: (){
            if(currentStep!=0)
              setState(()=>{currentStep--});
          },
          onStepTapped: (index){
          setState(()=>{currentStep=index});
          },
          steps: [

                 Step(isActive:currentStep>=0,title: Text('معلومات شخصية'), content: Column(children: [
                   TextFormField(
                     controller: nameController,
                      textAlign: TextAlign.end,
                      decoration:
                   InputDecoration(
                         alignLabelWithHint: true,
                   hintText: "اسم الطالب",

            ),
            ),
                     SizedBox(height: 15,),
                   TextFormField(
                     controller: idController,
                        textAlign: TextAlign.end,
                     decoration:
                   InputDecoration(
                       hintText: "رقم الهوية",
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
                   SizedBox(height: 30,),
    ],
                 )
                 ),
                     Step(isActive:currentStep>=1,title: Text('المدرسة'), content: Column(children: [
                       TextFormField(
                         controller: schoolNameController,
                            textAlign: TextAlign.end,
                            decoration:
                        InputDecoration(
                           alignLabelWithHint: true,

                                  hintText: "اسم المدرسة",

        ),
      ),
                       SizedBox(height: 15,),
                       Text('الصف',  ),
                         SfSlider(

                             activeColor:Color(0xFF364F6B),
                               enableTooltip: true,
                              showTicks: true,
                              showLabels: true,
                          value: sclass,
                          max: 12,
                           onChanged:  (value){
                                  setState(()=>sclass=value.toInt());

                     }
                         ),
                        SizedBox(height: 15,),
                             Text('العمر',),
                          SfSlider(

                                   activeColor: Color(0xFF364F6B),
                                 enableTooltip: true,
                              showTicks: true,
                                  showLabels: true,
                                   value: age,
                                     max: 20,
                                  onChanged:  (value){
                              print(value);
                             setState(()=>{age= value.toInt()});

                            }),
                        SizedBox(height: 30,),



                    ],
                     )
                     ),
               Step(isActive:currentStep>=2,title: Text('تفاصيل الاحتياج'), content: Column(children: [
                  TextFormField(
                    controller: detailsOfNeedController,
                      keyboardType: TextInputType.multiline,
                      minLines: 2,
                     maxLines: 100,
                   decoration:
                   InputDecoration(
                       fillColor: Colors.white,
                       filled: true,

        ),
      ),
                 SizedBox(height: 30,),
            ],
               )
               ),

          ],
    )
    );
  }}





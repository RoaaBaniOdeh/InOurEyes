import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void   Function(String )? onSubmit,
  void   Function( )?  onTap,
  void Function(String )? onChange,
  @required String? Function(String? )? validate,
  required String? label,
  @required IconData  ? prefix,
  IconData  ?suffix,
  void Function() ? suffixPressed,
  bool isPassword =false,
  bool isClickable =true,
})=>   TextFormField(
  textAlign:TextAlign.end,
  enabled:isClickable ,
  controller: controller,
  onTap: onTap,
  keyboardType: type,
  obscureText:isPassword,
  onFieldSubmitted :  onSubmit  ,
  onChanged: onChange,
  validator: validate,
  decoration:  InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      onPressed:suffixPressed ,
      icon: Icon(
        suffix,
      ),
    ) :null,
  ),
);




 class MyButtonForHome extends StatelessWidget {
   final String iconImagePath;
   final String buttonText;
   final VoidCallback onPress;
   const MyButtonForHome({
     Key? key,
     required this.iconImagePath,
     required this.buttonText,
     required this.onPress,
 }) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return  GestureDetector(
       child: Column(
         children: [

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
             child: Center(
               child:Image.asset(iconImagePath),
             ),
           ),
           SizedBox(height: 5,),
           Text(
             buttonText,
             style: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.bold,
               color: Colors.grey[800],
             ),

           ),

         ],
       ),
       onTap: onPress,
     );
   }
 }


 //for the fetched  data  from the firebase

class RowWithFetchedDataFromFireBase extends StatelessWidget {
   final String iconImagePath;
   final String tileTitle;
   final String tileSubTitle;
   const RowWithFetchedDataFromFireBase({
     Key? key,
     required this.iconImagePath,
     required this.tileSubTitle,
     required this.tileTitle,
   }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(12),//only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(tileTitle,

                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lateef',
                    fontSize: 35,)

              ),
              Text(tileSubTitle,
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
            padding: EdgeInsets.all(5),
            height: 70,
            width: 70,
            // decoration: BoxDecoration(color: Colors.grey.shade400),
            child: Image.asset(iconImagePath,),
          ),
        ],
      ),
    );
  }
}










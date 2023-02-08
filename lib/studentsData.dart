import 'package:flutter/material.dart';

List<fetchStudentsData_model> snotification = [];

class studentsNotification extends StatelessWidget {
  const studentsNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(snotification);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'معلومات الطالبات المحتاجات',
          style: TextStyle(
            fontFamily: 'Lateef',
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => build_snotification(
                  snotification[snotification.length - index - 1]),
              separatorBuilder: (context, index) => SizedBox(height: 8.0,),
              itemCount: snotification.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget build_snotification(fetchStudentsData_model not) {
    print(not);
    print("hello");
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Text('student name: ' + not.sname!),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text('Id: ' + not.sid.toString()),
              ),
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text('details : ' + not.details.toString()),
              ),
            ),
            SizedBox(height: 15,),
            Text('phone number:  ' + not.sphoneNumber!),
            SizedBox(height: 15,),
            Container(child: not.sclass != null ? Text('class : ' + not.sclass!) : null),
            SizedBox(height: 15,),
            Container(child: not.school != null ? Text('school: ' + not.school!) : null),
            SizedBox(height: 15,),
            Container(child: not.sage != null ? Text('age:  ' + not.sage!) : null),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}

class fetchStudentsData_model {
  @required
  String sname;
  @required
  String sid;
  @required
  String sphoneNumber;
  String? school;
  String? sclass;
  String? sage;
  @required
  String details;

  fetchStudentsData_model(this.sname, this.sid, this.sphoneNumber, this.school,
      this.sclass, this.sage, this.details) {
    print("1111");
  }
}

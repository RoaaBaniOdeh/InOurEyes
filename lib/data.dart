import 'package:flutter/material.dart';

List<fetchData_model> notification = [];

class customerNotification extends StatelessWidget {
  const customerNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
            'المتبرعين',
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
              itemBuilder: (context, index) => build_notification(
                  notification[notification.length - index - 1]),
              separatorBuilder: (context, index) => SizedBox(
                height: 8.0,
              ),
              itemCount: notification.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget build_notification(fetchData_model not) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text('name : ' + not.name!),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text('address : ' + not.address.toString()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('phone number : ' + not.phoneNumber!),
            SizedBox(
              height: 15,
            ),
            Container(
                child: not.others != null
                    ? Text('others : ' + not.others!)
                    : null),
            SizedBox(
              height: 15,
            ),
            Container(
                child: not._courseHelp != null
                    ? Text('_courseHelp : ' + not._courseHelp!)
                    : null),
            SizedBox(
              height: 15,
            ),
            Container(
                child: not.season != null
                    ? Text('season : ' + not.season!)
                    : null),
            SizedBox(
              height: 15,
            ),
            Container(
                child:
                    not.major != null ? Text('major : ' + not.major!) : null),
            SizedBox(
              height: 15,
            ),
            Container(
                child: not.type != null ? Text(' type : ' + not.type!) : null),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class fetchData_model {
  @required
  String name;
  @required
  String address;
  @required
  String phoneNumber;
  String? others;
  String? _courseHelp;
  String? age;
  String? season;
  String? major;
  String? type;

  fetchData_model(this.name, this.address, this.phoneNumber, this.others,
      this._courseHelp, this.age, this.season, this.major, this.type);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

var countdonaters=0;
void getCountsOfDonaters(){
  countdonaters = 0;
  FirebaseFirestore.instance.collection('donaters').get().then((value) {
    value.docs.forEach((element){
        countdonaters++;
    });
    print(countdonaters);
  }).catchError((error) {});

}
var countneeders=0;
void getCountsOfneeders(){
  countneeders = 0;
  FirebaseFirestore.instance.collection('needers').get().then((value) {
    value.docs.forEach((element){
      countneeders++;
    });
    print(countneeders);
  }).catchError((error) {});

}



class BoardingModel {
  final String? image;
  final String? title;
  final String? body;

  BoardingModel({
    @required this.title,
    @required this.image,
    @required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  static const String OnBoardingScreenRoute ='OnBoardingScreen';
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  _OnBoardingScreenState(){
    getCountsOfDonaters();
    getCountsOfneeders();
  }

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'Images/helping_hand.png',
      title: 'إنك بأعيننا',
      body: '  وجدت هذه الفكرة والتطبيق من منطلق العلاقة بين الأهل والمتجتمع المحلي التي تقوم على تبادل المنافع،ولتحقيق بيئة داعمة للتعلم وتنفيذاً للدور المجتمعي الذي تقوم به المدرسة ',
    ),
    BoardingModel(
      image: 'Images/purpose.png',
      title: 'الهدف والغاية',
      body: 'المساهمة في تلبية احتياجات الطالبات المحتاجات وتقديم الدعم لهنّ،ولتكون المدرسة أداة من أدوات محاربة الفقر',
    ),
    BoardingModel(
      image: 'Images/idea.png',
      title: 'الرؤية',
      body: 'عملاً بقول الله تعالى(وَتَعَاوَنُواْ عَلَى الْبرِّ وَالتَّقْوَى وَلاَ تَعَاوَنُواْ عَلَى الإِثْمِ وَالْعُدْوَانِ) ',
    ),
  ];

  bool isLast = false;

  void submit() {


    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80),//only(top: 80,left:50,right:50),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
               SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,

                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast)
                    {
                    submit();
                    } else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'ReemKufi',
            fontSize: 50,
            color: Colors.purple,
          ),

      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
          style: TextStyle(
            fontFamily: 'Lateef',
            fontSize: 20,
          )
      ),
      SizedBox(
        height: 30.0,
      ),
    ],
  );
}
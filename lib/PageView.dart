import 'dart:async';
import 'package:flutter/material.dart';
import 'package:updatedui2/splashScreen.dart';
import 'main.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Data {
  final String title;
  final String description;
  final String imageUrl;
  final IconData iconData;

  Data(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.iconData});
}

class PgaeView extends StatefulWidget {
  const PgaeView({Key? key}) : super(key: key);

  @override
  State<PgaeView> createState() => _PgaeViewState();
}

class _PgaeViewState extends State<PgaeView> {
   int selectedPage=0;
  PageController _controller = PageController(
    initialPage: 0,
  );

  int _currenIndex = 0;
  List<Data> data = [
    Data(
        title: 'Title 1 ',
        description:
            ' القدر.. ومفتى الجمهورية: العبادة فى هذه الأيام أحب إلى الله من غيرها.. وكان الرسول صلى الله عليه وسلم يجتهد فى هذه العشر ما لا يجتهد فى غيرها',
        imageUrl: 'images2/www.best-shara.net (1).jpg',
        iconData: Icons.camera),
    Data(
        title: 'Title 2 ',
        description:
            ' وأضاف أن العشر الأواخر من رمضان هي أيام وليال مباركة لها خصائص كثيرة، وتُعد نفحة ربانية ونقطة انطلاق يجب علينا أن ننتهزها ونعمل العمل الصالح ظاهرًا وباطنًا لعبادة الله وعمارة الأرض وتزكية النفس في هذه الأيام، وينبغي أن يزيد المسلم من إحسانه في الثلث الأخير من هذا الشهر المبارك، ويجتهد',
        imageUrl: 'images2/www.best-shara.net (2).jpg',
        iconData: Icons.circle),
    Data(
        title: 'Title 3',
        description:
            ' ولفت مفتي الجمهورية النظر إلى أنه قد فُضِّلَت هذه العشر على سائر أيام العام بوقوع ليلة القدر ضمن زمانها المبارك؛ يقول رسول الله صلى الله عليه وسلم: «تَحَرَّوْا ليلةَ القدرِ في العشر الأواخر مِن رمضان»، وهى ليلةٌ ساطعةُ البدر، جليلةُ القدر، عظيمةُ الأجر، يعدل ثوابُها ما يزيد على ثلاثةٍ وثمانين عامًا، لذا حذَّر',
        imageUrl: 'images2/www.best-shara.net (13).jpg',
        iconData: Icons.camera),
    Data(
        title: 'Title 4 ',
        description:
            ' ينشغلوا عنها بفضول الدنيا، عسى أن تنالهم من الله نفحات خير يسعدون بها في الدنيا والآخرة، فعن عَائِشَة رضي الله عنها قالت',
        imageUrl: 'images2/www.best-shara.net (14).jpg',
        iconData: Icons.translate)
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (_currenIndex < 3) _currenIndex++;
      _controller.animateToPage(_currenIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (ctx) => const MyApp(),
        '/b': (ctx) => const SplashScreenDart()
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Builder(
              builder: (ctx) => PageView(
                controller: _controller,
                onPageChanged: (val) {
                  selectedPage = val;
                  setState(() {
                    _currenIndex = val;
                    /*if (_currenIndex == 3) {
                      Future.delayed(const Duration(seconds: 2),
                          () => Navigator.of(ctx).pushNamed('/b'));
                    }*/
                  });
                },
                children: [
                  ...data
                      .map((item) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: ExactAssetImage(
                                  //عشان يخلي الصوره كانها backGround
                                  item.imageUrl,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  item.iconData,
                                  size: 35,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  item.description,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ],
              ),
            ),
            //Indicator(_currenIndex),
            Align(
              alignment: Alignment(0.0,0.80),
              child: PageViewDotIndicator(
                currentItem: selectedPage,
                count: 4,
                unselectedColor: Colors.black26,
                selectedColor: Colors.black,
                duration: Duration(seconds: 2),
                padding: EdgeInsets.zero,
                alignment: Alignment.bottomCenter,
                fadeEdges: false,
              ),
            ),

            Builder(builder: (ctx) {
              return Align(
                alignment: const Alignment(0.0, 0.93),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: ()async {
                      Navigator.of(ctx).pushNamed('/b');
                      SharedPreferences _prefs =  await SharedPreferences.getInstance();
                      _prefs.setBool('x', true);
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int index;

  const Indicator(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, 0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(index == 0 ? Colors.green : Colors.red),
          buildContainer(index == 1 ? Colors.green : Colors.red),
          buildContainer(index == 2 ? Colors.green : Colors.red),
          buildContainer(index == 3 ? Colors.green : Colors.red)
        ],
      ),
    );
  }

  Container buildContainer(Color color) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 15,
      height: 15,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

import 'package:ahzab_el_hamdia/Constants.dart';
import 'package:ahzab_el_hamdia/EnshadPlayerPages.dart';
import 'package:ahzab_el_hamdia/UI/Ahzab/DuaaKhtmKuraan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Ahzab/All_Ahzab_for_import.dart';
import 'Werd.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageSelected = 0, EnshadIndex = 0;
  List<String> categories = ["أحزاب", "انشاد"];
  PageController _pageController = new PageController();
  bool Night_Mode = false;

  @override
  void initState() {
    super.initState();
    read();
    EnshadIndex = 0;
  }

  Widget getAhzabPage() {
    return SingleChildScrollView(
      child: new StaggeredGrid.count(
        // scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        axisDirection: AxisDirection.down,
        crossAxisCount: 1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        children: <Widget>[
          SizedBox(
            child: AhzabListFiller(context, "الورد الحامدي", Werd()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "الجوهرة", AlGawhra()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "الوظيفة", AlWazifa()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "حزب البر", AlBr()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "حزب البحر", AlBhr()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "حزب اللطف", AlLtf()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "حزب الفلاح", AlFlah()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "حزب التوبة", AlTawba()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "حزب الاخلاص", Akhlas()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "حزب تفريج الكروب", Tafreg()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "حزب النصر", AlNasr()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "حزب الشكوى", AlShakwa()),
            height: 75,
          ),
          SizedBox(
            child: AhzabListFiller(context, "مناجاة", Mnagah()),
            height: 75,
          ),
          SizedBox(
            child:
                AhzabListFiller(context, "دعاء ختم القرآن", DuaaKhtmKuraan()),
            height: 75,
          ),
        ],
      ),
    );
  }

  GestureDetector AhzabListFiller(
      BuildContext context, String text, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: new Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/White-islam-quran-ramdan-vector.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: new Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Night_Mode ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  Widget getEnshadPage() {
    return SingleChildScrollView(
      child: new StaggeredGrid.count(
        crossAxisCount: 1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        axisDirection: AxisDirection.down,
        children: <Widget>[
          SizedBox(
            child: EnshadListFiller(context, "شئ لله يا ابا حامد", 0),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "شاذلى يا ابا الحسن", 1),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "صفت اوقاتنا", 2),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "فؤادي وجسمي وروحي لكم", 3),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "قصيدة سلامة سلامة", 4),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "هو مولانا", 5),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "يا اسم غالى", 6),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "يا قرة العيون يا سيدي سلامة", 7),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "يا سادة الحي", 8),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "يا حلو خالص", 9),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "توسلت بالهادي الحبيب محمد", 10),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "اياما بالوفا", 11),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "قسمآ بنور المصطفى و جماله", 12),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "حب سادتنا سعادة", 13),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "في حضرة تجلى", 14),
            height: 75,
          ),
          SizedBox(
            child: EnshadListFiller(context, "وحياة جمالك", 15),
            height: 75,
          ),
        ],
      ),
    );
  }

  GestureDetector EnshadListFiller(
      BuildContext context, String text, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EnshadPlayerPages(index: index)));
      },
      child: new Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/White-islam-quran-ramdan-vector.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: new Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color:
                    Night_Mode ? Colors.white.withOpacity(0.9) : Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
          backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
          appBar: new AppBar(
            title: new Text(
              _pageSelected == 0 ? "أحزاب الحامدية" : "انشاد",
              style: new TextStyle(
                  color: Night_Mode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
/*            actions: <Widget>[
              IconButton(
                icon: new Icon(
                  Icons.settings,
                  color: Night_Mode ? Colors.white : Colors.black,
                  size: 22,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Setting()));
                },
              ),
            ],*/
          ),
          body: Column(
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: new Column(
                      children: <Widget>[
                        new ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 2 - 40,
                          child: new RaisedButton(
                              child: new Text(
                                "أحزاب",
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontWeight: _pageSelected == 0
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    fontSize: _pageSelected == 0 ? 17 : 15,
                                    color: Night_Mode
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              color: Night_Mode ? DarkModeBlack : Colors.white,
                              elevation: 0,
                              onPressed: () {
                                setState(() {
                                  _pageSelected = 0;
                                  _pageController.animateToPage(0,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.linear);
                                });
                              }),
                        ),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          color: Night_Mode
                              ? _pageSelected == 0
                                  ? Color.fromRGBO(20, 150, 90, 1)
                                  : Color.fromRGBO(20, 100, 90, 0.5)
                              : _pageSelected == 0
                                  ? Color.fromRGBO(32, 96, 101, 1)
                                  : Color.fromRGBO(32, 96, 101, 0.6),
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: new Column(
                      children: <Widget>[
                        new ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 2 - 40,
                          child: new RaisedButton(
                              child: new Text(
                                "أنشاد",
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontWeight: _pageSelected == 1
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    fontSize: _pageSelected == 1 ? 17 : 15,
                                    color: Night_Mode
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              color: Night_Mode ? DarkModeBlack : Colors.white,
                              elevation: 0,
                              onPressed: () {
                                setState(() {
                                  _pageSelected = 1;
                                  _pageController.animateToPage(1,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.linear);
                                });
                              }),
                        ),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          color: Night_Mode
                              ? _pageSelected == 1
                                  ? Color.fromRGBO(98, 71, 136, 1)
                                  : Color.fromRGBO(100, 71, 150, 0.5)
                              : _pageSelected == 1
                                  ? Color.fromRGBO(155, 70, 180, 1)
                                  : Color.fromRGBO(155, 70, 180, 0.4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              new Expanded(
                child: new PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _pageSelected = index;
                    });
                  },
                  children: <Widget>[
                    getAhzabPage(),
                    getEnshadPage(),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void read() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Night_Mode = preferences.getBool('Night_Mode') ?? false;
    });
  }
}

import 'package:ahzab_el_hamdia/UI/Ahzab/DuaaKhtmKuraan.dart';
import 'package:ahzab_el_hamdia/UI/Setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Werd.dart';
import 'Ahzab/All_Ahzab_for_import.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ahzab_el_hamdia/Constants.dart';
import 'package:ahzab_el_hamdia/EnshadPlayerPages.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageSelected = 0;
  List<String> categories = ["أحزاب", "انشاد"];
  PageController _pageController = new PageController();
  bool Night_Mode;

  @override
  void initState() {
    super.initState();
    read();
  }

  StaggeredGridView getAhzabPage() {
    return new StaggeredGridView.count(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      crossAxisCount: 1,
      crossAxisSpacing: 15,
      mainAxisSpacing: 10,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      children: <Widget>[
        AhzabListFiller(context, "الورد الحامدي", Werd()),
        AhzabListFiller(context, "الجوهره", AlGawhra()),
        AhzabListFiller(context, "الوظيفة", AlWazifa()),
        AhzabListFiller(context, "حزب البر", AlBr()),
        AhzabListFiller(context, "حزب البحر", AlBhr()),
        AhzabListFiller(context, "حزب اللطف", AlLtf()),
        AhzabListFiller(context, "حزب الفلاح", AlFlah()),
        AhzabListFiller(context, "حزب التوبه", AlTawba()),
        AhzabListFiller(context, "حزب الاخلاص", Akhlas()),
        AhzabListFiller(context, "حزب تفريج الكروب", Tafreg()),
        AhzabListFiller(context, "حزب النصر", AlNasr()),
        AhzabListFiller(context, "حزب الشكوى", AlShakwa()),
        AhzabListFiller(context, "مناجاة", Mnagah()),
        AhzabListFiller(context, "دعاء ختم القرآن", DuaaKhtmKuraan()),
      ],
      staggeredTiles: [
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
      ],
    );
  }

  GestureDetector AhzabListFiller(BuildContext context, String text,
      Widget page) {
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

  StaggeredGridView getEnshadPage() {
    return new StaggeredGridView.count(
      crossAxisCount: 1,
      crossAxisSpacing: 15,
      mainAxisSpacing: 10,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      children: <Widget>[
        EnshadListFiller(context, "سيدي سلامة يا روحي", 0),
        EnshadListFiller(context, "شئ لله يا ابا حامد", 1),
        EnshadListFiller(context, "شاذلى يا ابا الحسن", 2),
        EnshadListFiller(context, "صفت اوقاتنا", 3),
        EnshadListFiller(context, "فؤادي وجسمي وروحي لكم", 4),
        EnshadListFiller(context, "قصيدة سلامة سلامة", 5),
        EnshadListFiller(context, "هو مولانا", 6),
        EnshadListFiller(context, "يا اسم غالى", 7),
        EnshadListFiller(context, "يا قرة العيون يا سيدي سلامة", 8),
        EnshadListFiller(context, "يا سادة الحي", 9),
        EnshadListFiller(context, "يا حلو خالص", 10),
        EnshadListFiller(context, "توسلت بالهادي الحبيب محمد", 11),
        EnshadListFiller(context, "سيدي صالح نظرة الى الاحباب", 12),
        EnshadListFiller(context, "اياما بالوفا", 13),
        EnshadListFiller(context, "قسمآ بنور المصطفى و جماله", 14),
        EnshadListFiller(context, "حب سادتنا سعادة", 15),
        EnshadListFiller(context, "في حضرة تجلى", 16),
        EnshadListFiller(context, "وحياة جمالك", 17),
      ],
      staggeredTiles: [
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
        StaggeredTile.extent(1, 75),
      ],
    );
  }

  GestureDetector EnshadListFiller(BuildContext context, String text,
      int index) {
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
            image: AssetImage('assets/Black-islam-quran-ramdan-vector.png'),
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
//            actions: <Widget>[
//              IconButton(
//                icon: new Icon(
//                  Icons.settings,
//                  color: Night_Mode ? Colors.white : Colors.black,
//                  size: 22,
//                ),
//                onPressed: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => Setting()));
//                },
//              ),
//            ],
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
                          minWidth: MediaQuery
                              .of(context)
                              .size
                              .width / 2 - 40,
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2 - 40,
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
                          minWidth: MediaQuery
                              .of(context)
                              .size
                              .width / 2 - 40,
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2 - 40,
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

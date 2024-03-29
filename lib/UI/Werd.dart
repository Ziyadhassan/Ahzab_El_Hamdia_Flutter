import 'package:ahzab_el_hamdia/Dialogs.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

import '../Constants.dart';

class Werd extends StatefulWidget {
  @override
  _WerdState createState() => _WerdState();
}

class _WerdState extends State<Werd> {
  late AudioCache _audioCache;
  bool Night_Mode = false;
  int counter = 0;
  String middletext = "أستغفر الله العظيم";
  bool indicator = false;

  @override
  void initState() {
    super.initState();
    _read();
    _audioCache = AudioCache();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _read() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    setState(() {
      counter = perfs.getInt('counter') ?? 0;
      middletext = perfs.getString('midlle_text') ?? "أستغفر الله العظيم";
      indicator = perfs.getBool('indicator') ?? false;
      Night_Mode = perfs.getBool('Night_Mode') ?? false;
    });

    if (indicator == true) {
      bool? _res = await showDialog<bool>(
          context: context, builder: (context) => WerdOnStart());

      if (_res == false) {
        _reset();
      }
    }
  }

  _save() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    perfs.setInt('counter', counter);
    perfs.setString('midlle_text', middletext);
    perfs.setBool('indicator', indicator);
  }

  void _setCounter() {
    indicator = true;
    setState(() {
      Vibration.vibrate(duration: 60);
      counter = counter + 1;
      if (counter == 90) {
        _audioCache.play('beepbeep.mp3');
      }
      if (counter == 100) {
        _audioCache.play('moonbeam.mp3');
        counter = 0;

        switch (middletext) {
          case "أستغفر الله العظيم":
            {
              middletext =
                  "اللهم صل على سيدنا محمد عبدك و نبيك و رسولك النبي الامي و على آله و صحبه و سلم";
            }
            break;
          case "اللهم صل على سيدنا محمد عبدك و نبيك و رسولك النبي الامي و على آله و صحبه و سلم":
            {
              middletext = "لا اله الا الله";
            }
            break;
          case "لا اله الا الله سيدنا محمد رسول الله صل الله عليه و على اله و صحبة و سلم":
            {
              showDialog(
                  context: context, builder: (context) => WerdOnEndDialog());
              _reset();
            }
        }
      }

      if (counter == 99 && middletext == "لا اله الا الله") {
        middletext =
            "لا اله الا الله سيدنا محمد رسول الله صل الله عليه و على اله و صحبة و سلم";
      }
    });
    _save();
  }

  void _reset() {
    setState(() {
      counter = 0;
      middletext = "أستغفر الله العظيم";
      indicator = false;
    });
    _save();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
        appBar: new AppBar(
          title: new Text("الورد الحامدي",
              style: new TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.white)),
          backgroundColor: Night_Mode
              ? Color.fromRGBO(2, 46, 52, 0.7)
              : Color.fromRGBO(32, 96, 101, 1),
          centerTitle: true,
          actions: <Widget>[
            new AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild: new Container(),
              secondChild: new IconButton(
                icon: new Icon(Icons.replay),
                onPressed: _reset,
                tooltip: "تصفير",
              ),
              crossFadeState: indicator
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            )
          ],
        ),
        body: new Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: new Text("${counter}",
                    style: new TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.height > 600 ? 75 : 50,
                        fontWeight: FontWeight.w500,
                        color: (counter >= 90)
                            ? Colors.red
                            : Night_Mode
                                ? Colors.white
                                : Colors.black)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: new AutoSizeText("${middletext}",
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: new TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Night_Mode ? Colors.white : Colors.black)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: new GestureDetector(
                onTap: () {
                  _setCounter();
                },
                child: new Container(
                  height: 148,
                  width: 300,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("lib/Images/buttonwall.png"),
                          fit: BoxFit.contain)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

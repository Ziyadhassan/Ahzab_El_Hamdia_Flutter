import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:ahzab_el_hamdia/Dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import '../Constants.dart';

class Werd extends StatefulWidget {
  
  @override
  _WerdState createState() => _WerdState();
}

class _WerdState extends State<Werd> {
  AudioCache _audioCache;
  bool Night_Mode;
  int counter;
  String middletext;
  bool indicator;

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
      bool _res = await showDialog<bool>(
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

      if(counter == 99 && middletext == "لا اله الا الله")
        {
          middletext = "لا اله الا الله سيدنا محمد رسول الله صل الله عليه و على اله و صحبة و سلم";
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
                  color:Colors.white)),
          backgroundColor: Night_Mode ? Color.fromRGBO(2, 46, 52, 0.7) : Color.fromRGBO(32, 96, 101, 1),
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
            new Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: new Text("${counter}",
                    style: new TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.height > 600 ? 75 : 50,
                        fontWeight: FontWeight.w500,
                        color: (counter >= 90)
                            ? Colors.red
                            : Night_Mode ? Colors.white : Colors.black))),
            Expanded(
              child: new Container(
                alignment: Alignment.center,
                child: new Text("${middletext}",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: new TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.height > 600 ? 30 : 20,
                        fontWeight: FontWeight.bold,
                        color: Night_Mode ? Colors.white : Colors.black)),
              ),
            ),
            new Container(
                height: 148,
                width: 300,
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomCenter,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: new AssetImage("lib/Images/buttonwall.png"),
                        fit: BoxFit.contain),
                    color: Colors.transparent),
                child: new ButtonTheme(
                  minWidth: 300,
                  height: 148,
                  child: new RaisedButton(
                    onPressed: () {
                      _setCounter();
                    },
                    color: Colors.transparent,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

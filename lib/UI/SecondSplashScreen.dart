import 'package:ahzab_el_hamdia/Constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class SecondSplashScreen extends StatefulWidget {
  _SecondSplashScreenState createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  late bool Night_Mode;
  bool dump = false;

  @override
  void initState() {
    super.initState();
    Night_Mode = false;
    dump = true;
    read();
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
        appBar: new AppBar(
          title: new Text(
            "أحزاب الحامدية",
            style: new TextStyle(
                color: Night_Mode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
          centerTitle: true,
        ),
        body: Center(
          child: new AnimatedCrossFade(
              firstChild: new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              secondChild: Image.asset(
                "lib/Images/app_icon.png",
              ),
              alignment: Alignment.center,
              firstCurve: Curves.easeInOutBack,
              secondCurve: Curves.easeInOutBack,
              crossFadeState:
                  dump ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(seconds: 3)),
        ));
  }

  void read() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Night_Mode = preferences.getBool('Night_Mode') ?? false;
    });
  }
}

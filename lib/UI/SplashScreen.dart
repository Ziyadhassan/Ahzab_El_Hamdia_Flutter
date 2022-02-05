import 'package:ahzab_el_hamdia/Constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool Night_Mode;

  @override
  void initState() {
    super.initState();
    Night_Mode = false;
    read();
    Future.delayed(const Duration(milliseconds: 3000), () {
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
      body: new Container(
        width: 699,
        height: 1023,
        alignment: Alignment.center,
        child: new Image.asset(
          "lib/Images/open.jpg",
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  void read() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Night_Mode = preferences.getBool('Night_Mode') ?? false;
    });
  }
}

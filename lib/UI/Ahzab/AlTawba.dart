import 'package:flutter/material.dart';
import 'package:ahzab_el_hamdia/AhzabMainPage.dart';

class AlTawba extends StatefulWidget {
  @override
  _AlTawbaState createState() => _AlTawbaState();
}

class _AlTawbaState extends State<AlTawba> {
  String title = "حزب التوبة";
  double _firstpage = 40;
  double _lastpage = 54;
  String _audiolink = "";
  List<String> _imagies = [
    "lib/Images/AlTawba/ntub1.png",
    "lib/Images/AlTawba/ntub2.png",
    "lib/Images/AlTawba/ntub3.png",
    "lib/Images/AlTawba/ntub4.png",
    "lib/Images/AlTawba/ntub5.png",
    "lib/Images/AlTawba/ntub6.png",
    "lib/Images/AlTawba/ntub7.png",
    "lib/Images/AlTawba/ntub8.png",
    "lib/Images/AlTawba/ntub9.png",
    "lib/Images/AlTawba/ntub10.png",
    "lib/Images/AlTawba/ntub11.png",
    "lib/Images/AlTawba/ntub12.png",
    "lib/Images/AlTawba/ntub13.png",
    "lib/Images/AlTawba/ntub14.png",
    "lib/Images/AlTawba/ntub15.png",
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 40
    Duration(minutes: 1, seconds: 10), // Page 2 , 41
    Duration(minutes: 3, seconds: 29), // Page 3 , 42
    Duration(minutes: 4, seconds: 41), // Page 4 , 43
    Duration(minutes: 5, seconds: 57), // Page 5 , 44
    Duration(minutes: 7, seconds: 19), // Page 6 , 45
    Duration(minutes: 8, seconds: 21), // Page 7 , 46
    Duration(minutes: 10, seconds: 23), // Page 8 , 47
    Duration(minutes: 12, seconds: 55), // Page 9 , 48
    Duration(minutes: 12, seconds: 55), // Page 10 , 49
    Duration(minutes: 12, seconds: 55), // Page 11 , 50
    Duration(minutes: 12, seconds: 55), // Page 12 , 51
    Duration(minutes: 12, seconds: 55), // Page 13 , 52
    Duration(minutes: 12, seconds: 55), // Page 14 , 53
    Duration(minutes: 12, seconds: 55), // Page 15 , 54
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AhzabWithoutAudio(
      title: title,
      imagies: _imagies,
    );
  }
}

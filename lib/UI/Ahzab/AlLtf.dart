import 'package:ahzab_el_hamdia/AhzabMainPage.dart';
import 'package:flutter/material.dart';

class AlLtf extends StatefulWidget {
  @override
  _AlLtfState createState() => _AlLtfState();
}

class _AlLtfState extends State<AlLtf> {
  String title = "حزب اللطف";
  double _firstpage = 97;
  double _lastpage = 104;
  String _audiolink = "";
  List<String> _imagies = [
    "lib/Images/AlLtf/nltf1.png",
    "lib/Images/AlLtf/nltf2.png",
    "lib/Images/AlLtf/nltf3.png",
    "lib/Images/AlLtf/nltf4.png",
    "lib/Images/AlLtf/nltf5.png",
    "lib/Images/AlLtf/nltf6.png",
    "lib/Images/AlLtf/nltf7.png",
    "lib/Images/AlLtf/nltf8.png",
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 97
    Duration(minutes: 1, seconds: 10), // Page 2 , 98
    Duration(minutes: 3, seconds: 29), // Page 3 , 99
    Duration(minutes: 4, seconds: 41), // Page 4 , 100
    Duration(minutes: 5, seconds: 57), // Page 5 , 101
    Duration(minutes: 7, seconds: 19), // Page 6 , 102
    Duration(minutes: 8, seconds: 21), // Page 7 , 103
    Duration(minutes: 10, seconds: 23), // Page 8 , 104
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AhzabWithoutAudio(title: title, imagies: _imagies);
  }
}

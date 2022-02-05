import 'package:flutter/material.dart';

import '../../AhzabMainPage.dart';

class Tafreg extends StatefulWidget {
  @override
  _TafregState createState() => _TafregState();
}

class _TafregState extends State<Tafreg> {
  String title = "تفريج الكروب";
  double _firstpage = 18;
  double _lastpage = 30;
  String _audiolink = "";
  List<String> _imagies = [
    "lib/Images/Tafreg/ntf1.jpg",
    "lib/Images/Tafreg/ntf2.jpg",
    "lib/Images/Tafreg/ntf3.jpg",
    "lib/Images/Tafreg/ntf4.jpg",
    "lib/Images/Tafreg/ntf5.jpg",
    "lib/Images/Tafreg/ntf6.jpg",
    "lib/Images/Tafreg/ntf7.jpg",
    "lib/Images/Tafreg/ntf8.jpg",
    "lib/Images/Tafreg/ntf9.jpg",
    "lib/Images/Tafreg/ntf10.jpg",
    "lib/Images/Tafreg/ntf11.jpg",
    "lib/Images/Tafreg/ntf12.jpg",
    "lib/Images/Tafreg/ntf13.jpg",
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 18
    Duration(minutes: 1, seconds: 10), // Page 2 , 19
    Duration(minutes: 3, seconds: 29), // Page 3 , 20
    Duration(minutes: 4, seconds: 41), // Page 4 , 21
    Duration(minutes: 5, seconds: 57), // Page 5 , 22
    Duration(minutes: 7, seconds: 19), // Page 6 , 23
    Duration(minutes: 8, seconds: 21), // Page 7 , 24
    Duration(minutes: 10, seconds: 23), // Page 8 , 25
    Duration(minutes: 12, seconds: 55), // Page 9 , 26
    Duration(minutes: 14, seconds: 00), // Page 10 , 27
    Duration(minutes: 15, seconds: 21), // Page 11, 28
    Duration(minutes: 17, seconds: 8), // Page 12 , 29
    Duration(minutes: 18, seconds: 35), // Page 13 , 30
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

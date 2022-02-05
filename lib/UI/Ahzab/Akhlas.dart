import 'package:ahzab_el_hamdia/AhzabMainPage.dart';
import 'package:flutter/material.dart';

class Akhlas extends StatefulWidget {
  @override
  _AkhlasState createState() => _AkhlasState();
}

class _AkhlasState extends State<Akhlas> {
  String title = "حزب الأخلاص";
  double _firstpage = 31;
  double _lastpage = 39;
  String _audiolink = "";
  List<String> _imagies = [
    "lib/Images/AlAklhas/nakh1.jpg",
    "lib/Images/AlAklhas/nakh2.jpg",
    "lib/Images/AlAklhas/nakh3.jpg",
    "lib/Images/AlAklhas/nakh4.jpg",
    "lib/Images/AlAklhas/nakh5.jpg",
    "lib/Images/AlAklhas/nakh6.jpg",
    "lib/Images/AlAklhas/nakh7.jpg",
    "lib/Images/AlAklhas/nakh8.jpg",
    "lib/Images/AlAklhas/nakh9.jpg",
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 31
    Duration(minutes: 1, seconds: 10), // Page 2 , 32
    Duration(minutes: 3, seconds: 29), // Page 3 , 33
    Duration(minutes: 4, seconds: 41), // Page 4 , 34
    Duration(minutes: 5, seconds: 57), // Page 5 , 35
    Duration(minutes: 7, seconds: 19), // Page 6 , 36
    Duration(minutes: 8, seconds: 21), // Page 7 , 37
    Duration(minutes: 10, seconds: 23), // Page 8 , 38
    Duration(minutes: 12, seconds: 55), // Page 9 , 39
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

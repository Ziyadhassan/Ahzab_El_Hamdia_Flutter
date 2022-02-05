import 'package:ahzab_el_hamdia/AhzabMainPage.dart';
import 'package:flutter/material.dart';

class AlFlah extends StatefulWidget {
  @override
  _AlFlahState createState() => _AlFlahState();
}

class _AlFlahState extends State<AlFlah> {
  String title = "حزب الفلاح";
  double _firstpage = 124;
  double _lastpage = 126;
  String _audiolink = "";
  List<String> _imagies = [
    "lib/Images/AlFlah/nfl1.png",
    "lib/Images/AlFlah/nfl2.png",
    "lib/Images/AlFlah/nfl3.png",
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 124
    Duration(minutes: 1, seconds: 10), // Page 2 , 125
    Duration(minutes: 3, seconds: 29), // Page 3 , 126
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

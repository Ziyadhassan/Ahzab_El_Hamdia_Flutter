import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../AhzabMainPage.dart';

class AlBhr extends StatefulWidget {
  @override
  _AlBhrState createState() => _AlBhrState();
}

class _AlBhrState extends State<AlBhr> {
  String title = "حزب البحر";
  double _firstpage = 86;
  double _lastpage = 91;
  String _audiolink = "";
  List<String> _imagies = [
    "lib/Images/AlBhr/nbhr1.png",
    "lib/Images/AlBhr/nbhr2.png",
    "lib/Images/AlBhr/nbhr3.png",
    "lib/Images/AlBhr/nbhr4.png",
    "lib/Images/AlBhr/nbhr5.png",
    "lib/Images/AlBhr/nbhr6.png",
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 86
    Duration(minutes: 1, seconds: 10), // Page 2 , 87
    Duration(minutes: 3, seconds: 29), // Page 3 , 88
    Duration(minutes: 4, seconds: 41), // Page 4 , 89
    Duration(minutes: 5, seconds: 57), // Page 5 , 90
    Duration(minutes: 7, seconds: 19), // Page 6 , 91
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AhzabWithoutAudio(
      imagies: _imagies,
      title: title,
    );
  }
}

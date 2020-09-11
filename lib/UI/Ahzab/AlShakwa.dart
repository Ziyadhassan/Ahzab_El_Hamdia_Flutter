import 'package:flutter/material.dart';
import 'package:ahzab_el_hamdia/AhzabMainPage.dart';

class AlShakwa extends StatefulWidget {
  @override
  _AlShakwaState createState() => _AlShakwaState();
}

class _AlShakwaState extends State<AlShakwa> {
  String title = "حزب الشكوى";
  double _firstpage = 105;
  double _lastpage = 123;
  String _audiolink = "";
  List<String> _imagies = [
    "lib/Images/ALShakwa/nsh1.png",
    "lib/Images/ALShakwa/nsh2.png",
    "lib/Images/ALShakwa/nsh3.png",
    "lib/Images/ALShakwa/nsh4.png",
    "lib/Images/ALShakwa/nsh5.png",
    "lib/Images/ALShakwa/nsh6.png",
    "lib/Images/ALShakwa/nsh7.png",
    "lib/Images/ALShakwa/nsh8.png",
    "lib/Images/ALShakwa/nsh9.png",
    "lib/Images/ALShakwa/nsh10.png",
    "lib/Images/ALShakwa/nsh11.png",
    "lib/Images/ALShakwa/nsh12.png",
    "lib/Images/ALShakwa/nsh13.png",
    "lib/Images/ALShakwa/nsh14.png",
    "lib/Images/ALShakwa/nsh15.png",
    "lib/Images/ALShakwa/nsh16.png",
    "lib/Images/ALShakwa/nsh17.png",
    "lib/Images/ALShakwa/nsh18.png",
    "lib/Images/ALShakwa/nsh19.png",
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 105
    Duration(minutes: 1, seconds: 10), // Page 2 , 106
    Duration(minutes: 3, seconds: 29), // Page 3 , 107
    Duration(minutes: 4, seconds: 41), // Page 4 , 108
    Duration(minutes: 5, seconds: 57), // Page 5 , 109
    Duration(minutes: 7, seconds: 19), // Page 6 , 110
    Duration(minutes: 8, seconds: 21), // Page 7 , 111
    Duration(minutes: 10, seconds: 23), // Page 8 , 112
    Duration(minutes: 12, seconds: 55), // Page 9 , 113
    Duration(minutes: 14, seconds: 00), // Page 10 , 114
    Duration(minutes: 15, seconds: 21), // Page 11, 115
    Duration(minutes: 17, seconds: 8), // Page 12 , 116
    Duration(minutes: 18, seconds: 35), // Page 13 , 117
    Duration(minutes: 20, seconds: 1), // Page 14 , 118
    Duration(minutes: 21, seconds: 49), // Page 15 , 119
    Duration(minutes: 24, seconds: 5), // Page 16 , 120
    Duration(minutes: 25, seconds: 17), // Page 17 , 121
    Duration(minutes: 27, seconds: 51), // Page 18 , 122
    Duration(minutes: 29, seconds: 13), // Page 19 , 123
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

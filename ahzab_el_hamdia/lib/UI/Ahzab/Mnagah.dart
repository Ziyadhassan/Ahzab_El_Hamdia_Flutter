import 'package:ahzab_el_hamdia/AhzabMainPage.dart';
import 'package:flutter/material.dart';

class Mnagah extends StatefulWidget {
  @override
  _MnagahState createState() => _MnagahState();
}

class _MnagahState extends State<Mnagah> {
  String title = "مناجاة";
  double _firstpage = 127;
  double _lastpage = 135;
  String _audiolink = "";
  List<String> _imagies = [
    "lib/Images/Mnagah/nmna1.jpg",
    "lib/Images/Mnagah/nmna2.png",
    "lib/Images/Mnagah/nmna3.png",
    "lib/Images/Mnagah/nmna4.png",
    "lib/Images/Mnagah/nmna5.jpg",
    "lib/Images/Mnagah/nmna6.png",
    "lib/Images/Mnagah/nmna7.png",
    "lib/Images/Mnagah/nmna8.png",
    "lib/Images/Mnagah/nmna9.jpg",
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 127
    Duration(minutes: 1, seconds: 10), // Page 2 , 128
    Duration(minutes: 3, seconds: 29), // Page 3 , 129
    Duration(minutes: 4, seconds: 41), // Page 4 , 130
    Duration(minutes: 5, seconds: 57), // Page 5 , 131
    Duration(minutes: 7, seconds: 19), // Page 6 , 132
    Duration(minutes: 8, seconds: 21), // Page 7 , 133
    Duration(minutes: 10, seconds: 23), // Page 8 , 134
    Duration(minutes: 12, seconds: 55), // Page 9 , 135
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

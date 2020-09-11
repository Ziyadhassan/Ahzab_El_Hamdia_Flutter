import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ahzab_el_hamdia/AhzabMainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlBr extends StatefulWidget {
  @override
  _AlBrState createState() => _AlBrState();
}

class _AlBrState extends State<AlBr> {
  String title = "حزب البر";
  double _firstpage = 66;
  double _lastpage = 85;
  String _audiolink =
      "https://dl.dropboxusercontent.com/s/2nuuqyhm0q7t021/%D8%AD%D8%B2%D8%A8%20%D8%A7%D9%84%D8%A8%D8%B1%20-%20%D8%A8%D8%B5%D9%88%D8%AA%20%D8%A7%D9%84%D8%B4%D9%8A%D8%AE%20%D8%B9%D9%84%D9%89%20%D8%AE%D9%84%D9%8A%D9%81%D9%87.m4a";
  List<String> _imagies = [
    "lib/Images/AlBr/nbr1.png",
    "lib/Images/AlBr/nbr2.png",
    "lib/Images/AlBr/nbr3.png",
    "lib/Images/AlBr/nbr4.png",
    "lib/Images/AlBr/nbr5.png",
    "lib/Images/AlBr/nbr6.png",
    "lib/Images/AlBr/nbr7.png",
    "lib/Images/AlBr/nbr8.png",
    "lib/Images/AlBr/nbr9.png",
    "lib/Images/AlBr/nbr10.png",
    "lib/Images/AlBr/nbr11.png",
    "lib/Images/AlBr/nbr12.png",
    "lib/Images/AlBr/nbr13.png",
    "lib/Images/AlBr/nbr14.png",
    "lib/Images/AlBr/nbr15.png",
    "lib/Images/AlBr/nbr16.png",
    "lib/Images/AlBr/nbr17.png",
    "lib/Images/AlBr/nbr18.png",
    "lib/Images/AlBr/nbr19.png",
    "lib/Images/AlBr/nbr20.png"
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 66
    Duration(minutes: 1, seconds: 14), // Page 2 , 67
    Duration(minutes: 3, seconds: 30), // Page 3 , 68
    Duration(minutes: 4, seconds: 46), // Page 4 , 69
    Duration(minutes: 6, seconds: 2), // Page 5 , 70
    Duration(minutes: 7, seconds: 19), // Page 6 , 71
    Duration(minutes: 8, seconds: 25), // Page 7 , 72
    Duration(minutes: 10, seconds: 25), // Page 8 , 73
    Duration(minutes: 12, seconds: 56), // Page 9 , 74
    Duration(minutes: 13, seconds: 59), // Page 10 , 75
    Duration(minutes: 15, seconds: 25), // Page 11, 76
    Duration(minutes: 17, seconds: 8), // Page 12 , 77
    Duration(minutes: 18, seconds: 36), // Page 13 , 78
    Duration(minutes: 20, seconds: 4), // Page 14 , 79
    Duration(minutes: 21, seconds: 49), // Page 15 , 80
    Duration(minutes: 23, seconds: 50), // Page 16 , 81
    Duration(minutes: 25, seconds: 17), // Page 17 , 82
    Duration(minutes: 27, seconds: 51), // Page 18 , 83
    Duration(minutes: 29, seconds: 13), // Page 19 , 84
    Duration(minutes: 30, seconds: 46), // Page 20 , 85
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AhzabWithAudio(
      title: title,
      firstpage: _firstpage,
      lastpage: _lastpage,
      audiolink: _audiolink,
      imagies: _imagies,
      durations: durations,
      tooltip: "تشغيل القرائه بصوت الشيخ على خليفه",
    );
  }
}

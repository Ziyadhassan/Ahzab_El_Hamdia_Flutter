import 'package:ahzab_el_hamdia/AhzabMainPage.dart';
import 'package:flutter/material.dart';

class AlWazifa extends StatefulWidget {
  @override
  _AlWazifaState createState() => _AlWazifaState();
}

class _AlWazifaState extends State<AlWazifa> {
  String title = "الوظيفه الشاذليه";
  double _firstpage = 55;
  double _lastpage = 65;
  String _audiolink =
      "https://dl.dropboxusercontent.com/s/b5p7664rm6vptgo/%D8%A7%D9%84%D9%88%D8%B8%D9%8A%D9%81%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B0%D9%84%D9%8A%D8%A9%20%D8%A8%D8%B5%D9%88%D8%AA%20%D8%AC%D9%85%D8%A7%D8%B9%D9%8A.mp3";
  List<String> _imagies = [
    "lib/Images/AlWazifa/nw1.png",
    "lib/Images/AlWazifa/nw2.png",
    "lib/Images/AlWazifa/nw3.png",
    "lib/Images/AlWazifa/nw4.png",
    "lib/Images/AlWazifa/nw5.png",
    "lib/Images/AlWazifa/nw6.png",
    "lib/Images/AlWazifa/nw7.png",
    "lib/Images/AlWazifa/nw8.png",
    "lib/Images/AlWazifa/nw9.png",
    "lib/Images/AlWazifa/nw10.png",
    "lib/Images/AlWazifa/nw11.png",
  ];

  // The list of duration of the perivous sound ( sound of baba 7ag )
  /*List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 55
    Duration(minutes: 0, seconds: 49), // Page 2 , 56
    Duration(minutes: 2, seconds: 3), // Page 3 , 57
    Duration(minutes: 3, seconds: 13), // Page 4 , 58
    Duration(minutes: 4, seconds: 16), // Page 5 , 59
    Duration(minutes: 5, seconds: 26), // Page 6 , 60
    Duration(minutes: 6, seconds: 46), // Page 7 , 61
    Duration(minutes: 7, seconds: 46), // Page 8 , 62
    Duration(minutes: 10, seconds: 5), // Page 9 , 63
    Duration(minutes: 12, seconds: 22), // Page 10 , 64
    Duration(minutes: 12, seconds: 55), // Page 11 , 65 // Msh Kamla
  ];*/

  List<Duration> durations = [
    Duration(minutes: 0, seconds: 14), // Page 1 , 55
    Duration(minutes: 0, seconds: 51), // Page 2 , 56
    Duration(minutes: 1, seconds: 50), // Page 3 , 57
    Duration(minutes: 2, seconds: 57), // Page 4 , 58
    Duration(minutes: 3, seconds: 55), // Page 5 , 59
    Duration(minutes: 4, seconds: 56), // Page 6 , 60
    Duration(minutes: 6, seconds: 6), // Page 7 , 61
    Duration(minutes: 7, seconds: 24), // Page 8 , 62
    Duration(minutes: 9, seconds: 57), // Page 9 , 63
    Duration(minutes: 12, seconds: 41), // Page 10 , 64
    Duration(minutes: 16, seconds: 25), // Page 11 , 65
  ];

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
      images: _imagies,
      durations: durations,
      tooltip: "تشغيل القرائه الجماعية",
    );
  }
}

import 'package:ahzab_el_hamdia/AhzabMainPage.dart';
import 'package:flutter/material.dart';

import '../../Dialogs.dart';

class AlNasr extends StatefulWidget {
  @override
  _AlNasrState createState() => _AlNasrState();
}

class _AlNasrState extends State<AlNasr> {
  String title = "احزب النصر";
  double _firstpage = 92;
  double _lastpage = 96;
  String _audiolink = "";
  List<String> _imagies = [
    "lib/Images/AlNasr/nnsr1.png",
    "lib/Images/AlNasr/nnsr2.png",
    "lib/Images/AlNasr/nnsr3.png",
    "lib/Images/AlNasr/nnsr4.png",
    "lib/Images/AlNasr/nnsr5.png",
  ];
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 92
    Duration(minutes: 1, seconds: 10), // Page 2 , 93
    Duration(minutes: 3, seconds: 29), // Page 3 , 94
    Duration(minutes: 4, seconds: 41), // Page 4 , 95
    Duration(minutes: 5, seconds: 57), // Page 5 , 96
  ];

  @override
  void initState() {
    super.initState();
    _showDialog();
  }

  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 500));
    showDialog(
        context: context,
        builder: (context) => GeneralDialogs(
            title: "انتبه", content: "هذا الحزب لا يقرء الا بأذن من الشيخ"));
  }

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

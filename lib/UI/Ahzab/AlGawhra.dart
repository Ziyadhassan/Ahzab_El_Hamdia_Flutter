import 'dart:core';

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

import '../../Constants.dart';
import '../../Dialogs.dart';

class AlGawhra extends StatefulWidget {
  @override
  _AlGawhraState createState() => _AlGawhraState();
}

class _AlGawhraState extends State<AlGawhra> {
  String audiolink =
      "https://dl.dropboxusercontent.com/s/gulsnlgwmbcxf6c/%D8%AC%D9%88%D9%87%D8%B1%D8%A9%20%D8%A7%D9%84%D8%AD%D8%A7%D9%85%D8%AF%D9%8A%D8%A9%20%D8%A8%D8%B5%D9%88%D8%AA%20%D8%AC%D9%85%D8%A7%D8%B9%D9%8A.mp3";
  late double firstpage, lastpage;
  CarouselController _scrollController = CarouselController();
  late double page;
  AudioPlayer _audioPlayer = AudioPlayer();
  bool _indicator = true;
  bool _playing = false;
  List<String> _images = [
    "lib/Images/AlGawhra/ng1.jpg",
    "lib/Images/AlGawhra/ng2.jpg",
    "lib/Images/AlGawhra/ng3.jpg",
    "lib/Images/AlGawhra/ng4.jpg",
    "lib/Images/AlGawhra/ng5.jpg",
    "lib/Images/AlGawhra/ng6.jpg",
    "lib/Images/AlGawhra/ng7.jpg",
    "lib/Images/AlGawhra/ng8.jpg",
    "lib/Images/AlGawhra/ng9.jpg",
    "lib/Images/AlGawhra/ng10.jpg",
    "lib/Images/AlGawhra/ng11.jpg",
    "lib/Images/AlGawhra/ng12.jpg",
    "lib/Images/AlGawhra/ng13.jpg"
  ];

  // The list of duration of the perivous sound ( sound of baba 7ag )
  /*List<Duration> durations = [
    Duration(minutes: 0, seconds: 0), // Page 1 , 5
    Duration(minutes: 0, seconds: 41), // Page 2 , 6
    Duration(minutes: 1, seconds: 54), // Page 3 , 7
    Duration(minutes: 3, seconds: 1), // Page 4 , 8
    Duration(minutes: 4, seconds: 16), // Page 5 , 9
    Duration(minutes: 5, seconds: 27), // Page 6 , 10
    Duration(minutes: 6, seconds: 43), // Page 7 , 11
    Duration(minutes: 7, seconds: 46), // Page 8 , 12
    Duration(minutes: 8, seconds: 48), // Page 9 , 13
    Duration(minutes: 9, seconds: 54), // Page 10 , 14
    Duration(minutes: 11, seconds: 9), // Page 11 , 15
    Duration(minutes: 12, seconds: 12), // Page 11 , 16
    Duration(minutes: 13, seconds: 27), // Page 11 , 17
  ];*/
  List<Duration> durations = [
    Duration(minutes: 0, seconds: 27), // Page 1 , 5
    Duration(minutes: 1, seconds: 4), // Page 2 , 6
    Duration(minutes: 2, seconds: 9), // Page 3 , 7
    Duration(minutes: 3, seconds: 13), // Page 4 , 8
    Duration(minutes: 4, seconds: 21), // Page 5 , 9
    Duration(minutes: 5, seconds: 28), // Page 6 , 10
    Duration(minutes: 6, seconds: 34), // Page 7 , 11
    Duration(minutes: 7, seconds: 39), // Page 8 , 12
    Duration(minutes: 8, seconds: 34), // Page 9 , 13
    Duration(minutes: 9, seconds: 30), // Page 10 , 14
    Duration(minutes: 10, seconds: 27), // Page 11 , 15
    Duration(minutes: 11, seconds: 21), // Page 11 , 16
    Duration(minutes: 12, seconds: 11), // Page 11 , 17
  ];
  bool Night_Mode = false;

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    firstpage = 5;
    lastpage = 17;
    Night_Mode = false;

    for (int i = 0; i < durations.length; i++) {
      _audioPlayer.onAudioPositionChanged.listen((Duration d) {
        if (d.inMinutes == durations[i].inMinutes &&
            d.inSeconds == durations[i].inSeconds) {
          setState(() {
            _scrollController.animateToPage(i,
                duration: Duration(milliseconds: 500), curve: Curves.linear);
          });
        }
      });
    }

    _audioPlayer.onPlayerCompletion.listen((event) {
      stop();
    });

    read();
  }

  void _animate() async {
    await _scrollController.onReady;
    _scrollController.animateToPage(7,
        duration: Duration(milliseconds: 2000), curve: Curves.linear);
  }

  @override
  void dispose() {
    // stop();
    _audioPlayer.stop();
    Wakelock.disable();
    _audioPlayer.dispose();
    super.dispose();
  }

  void play() async {
    final selectedPage = await showDialog<double>(
        context: context,
        builder: (context) => AhzabAudioDialog(
              firstpage: firstpage,
              lastpage: lastpage,
            ));

    if (selectedPage != null) {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        showDialog(
            context: context, builder: (context) => AudioWifiErrorDialog());
      } else if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        int result = await _audioPlayer.play(audiolink, stayAwake: true);
        if (result == 1) {
          setState(() {
            _audioPlayer
                .seek(durations[selectedPage.toInt() - firstpage.toInt()]);
            _playing = true;
            _indicator = false;
          });
        } else {
          showDialog(
              context: context, builder: (context) => AudioErrorDialog());
        }
      }
    }
  }

  void pause() {
    setState(() {
      if (_playing == true) {
        _playing = false;
        _audioPlayer.pause();
      } else {
        _playing = true;
        _audioPlayer.resume();
      }
    });
  }

  void stop() {
    setState(() {
      _indicator = true;
      _playing = false;
      _audioPlayer.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
        appBar: new AppBar(
          title: new Text(
            "الجوهرة الحامدية",
            style: new TextStyle(fontSize: _playing ? 16 : 20),
          ),
          backgroundColor: Night_Mode
              ? Color.fromRGBO(2, 46, 52, 0.7)
              : Color.fromRGBO(32, 96, 101, 1),
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.arrow_back), onPressed: _animate),
            _indicator
                ? new IconButton(
                    icon: new Icon(
                      Icons.volume_up,
                    ),
                    onPressed: () {
                      play();
                    },
                    tooltip: "تشغيل القرائه الجماعية")
                : new Row(children: <Widget>[
                    _playing
                        ? new IconButton(
                            icon: new Icon(Icons.pause),
                            onPressed: () {
                              pause();
                            },
                            iconSize: 30,
                            tooltip: "توقف مؤقت")
                        : new IconButton(
                            icon: new Icon(Icons.play_arrow),
                            onPressed: () {
                              pause();
                            },
                            iconSize: 30,
                            tooltip: "تكملة التشغيل"),
                    new IconButton(
                        icon: new Icon(Icons.stop),
                        onPressed: () {
                          stop();
                        },
                        iconSize: 30,
                        tooltip: "توقف"),
                  ]),
          ],
        ),
        body: CarouselSlider(
          carouselController: _scrollController,
          options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            initialPage: 0,
            reverse: true,
            enlargeCenterPage: true,
          ),
          items: _images
              .map(
                (item) => new Image.asset(item, fit: BoxFit.contain),
              )
              .toList(),
        ),
      ),
    );
  }

  void read() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Night_Mode = preferences.getBool('Night_Mode') ?? false;
    });
  }
}

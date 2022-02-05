import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants.dart';
import 'CustomSlider.dart';
import 'Dialogs.dart';

// Mainly used for AlBar and AlWazifa ( AlWazifa is recently removed )
// ignore: must_be_immutable
class AhzabWithAudio extends StatefulWidget {
  String title, audiolink, tooltip;
  double firstpage, lastpage;
  List<String> images;
  List<Duration> durations;

  AhzabWithAudio({
    required this.title,
    required this.firstpage,
    required this.lastpage,
    required this.audiolink,
    required this.images,
    required this.durations,
    required this.tooltip,
  });

  @override
  _AhzabWithAudioState createState() => _AhzabWithAudioState();
}

class _AhzabWithAudioState extends State<AhzabWithAudio> {
  late double page;
  late AudioPlayer _audioPlayer;
  late bool _indicator;
  late bool _playing;
  late CarouselController controller;
  bool Night_Mode = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = new AudioPlayer();
    page = widget.firstpage;
    _indicator = true;
    _playing = false;
    controller = CarouselController();
    Night_Mode = false;

    for (int i = 0; i < widget.durations.length; i++) {
      _audioPlayer.onAudioPositionChanged.listen((Duration d) {
        if (d.inMinutes == widget.durations[i].inMinutes &&
            d.inSeconds == widget.durations[i].inSeconds) {
          setState(() {
            controller.animateToPage(i,
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

  @override
  void dispose() {
    // stop();
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  void play() async {
    final selectedPage = await showDialog<double>(
        context: context,
        builder: (context) => AhzabAudioDialog(
              firstpage: widget.firstpage,
              lastpage: widget.lastpage,
            ));

    if (selectedPage != null) {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        showDialog(
            context: context, builder: (context) => AudioWifiErrorDialog());
      } else if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        int result = await _audioPlayer.play(widget.audiolink, stayAwake: true);
        if (result == 1) {
          setState(() {
            _audioPlayer.seek(widget
                .durations[selectedPage.toInt() - widget.firstpage.toInt()]);
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
          title: new Text("${widget.title}",
              style: new TextStyle(fontSize: _playing ? 16 : 20)),
          backgroundColor: Night_Mode
              ? Color.fromRGBO(2, 46, 52, 0.7)
              : Color.fromRGBO(32, 96, 101, 1),
          centerTitle: true,
          actions: <Widget>[
            new AnimatedCrossFade(
              duration: const Duration(milliseconds: 0),
              firstChild: new IconButton(
                  icon: new Icon(
                    Icons.volume_up,
                  ),
                  onPressed: () {
                    play();
                  },
//                  iconSize: 30,
                  tooltip: widget.tooltip),
              secondChild: new Row(children: <Widget>[
                new AnimatedCrossFade(
                  firstChild: new IconButton(
                      icon: new Icon(Icons.pause),
                      onPressed: () {
                        pause();
                      },
                      iconSize: 30,
                      tooltip: "توقف مؤقت"),
                  secondChild: new IconButton(
                      icon: new Icon(Icons.play_arrow),
                      onPressed: () {
                        pause();
                      },
                      iconSize: 30,
                      tooltip: "تكملة التشغيل"),
                  duration: const Duration(seconds: 0),
                  crossFadeState: _playing
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
                new IconButton(
                    icon: new Icon(Icons.stop),
                    onPressed: () {
                      stop();
                    },
                    iconSize: 30,
                    tooltip: "توقف"),
              ]),
              crossFadeState: _indicator
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            )
          ],
        ),
        body: CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            initialPage: 0,
            reverse: true,
            enlargeCenterPage: true,
          ),
          items: widget.images
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

// For the rest of the Ahzab
class AhzabWithoutAudio extends StatefulWidget {
  String title;
  List<String> imagies;

  AhzabWithoutAudio({
    required this.title,
    required this.imagies,
  });

  @override
  _AhzabWithoutAudioState createState() => _AhzabWithoutAudioState();
}

class _AhzabWithoutAudioState extends State<AhzabWithoutAudio> {
  bool Night_Mode = false;

  @override
  void initState() {
    super.initState();
    Night_Mode = false;
    read();
  }

  void read() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Night_Mode = preferences.getBool('Night_Mode') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
        appBar: new AppBar(
          title: new Text(widget.title),
          backgroundColor: Night_Mode
              ? Color.fromRGBO(2, 46, 52, 0.7)
              : Color.fromRGBO(32, 96, 101, 1),
          centerTitle: true,
        ),
        body: new CustomSlider(
          images: widget.imagies,
          controller: null,
        ),
      ),
    );
  }
}

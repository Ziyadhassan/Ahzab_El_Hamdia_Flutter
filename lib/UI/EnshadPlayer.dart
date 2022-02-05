import 'package:audioplayers/audioplayers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants.dart';
import '../Dialogs.dart';

class EnshadPlayer extends StatefulWidget {
  String title, singer, audiolink, downloadLink;
  int index;
  Duration _duration = Duration();
  Duration _position = Duration();
  late AudioPlayer _audioPlayer;

  EnshadPlayer({
    required this.title,
    required this.singer,
    required this.audiolink,
    required this.downloadLink,
    required this.index,
  });

  @override
  _EnshadPlayerState createState() => _EnshadPlayerState();
}

class _EnshadPlayerState extends State<EnshadPlayer> {
  late bool Night_Mode, _playing;

  @override
  void initState() {
    super.initState();
    Night_Mode = false;
    _playing = false;
    read();
    widget._audioPlayer = AudioPlayer(playerId: "Enshad${widget.index}");

     widget._audioPlayer.onDurationChanged.listen((event) {
       setState(() =>  widget._duration = event);
    });

    widget._audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() => widget._position = event);
    });


    widget._audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        widget._audioPlayer.stop();
        widget._position = Duration(seconds: 0);
        _playing = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget._audioPlayer.stop();
    widget._audioPlayer.dispose();
  }

  _launchURL() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
          context: context, builder: (context) => AudioWifiErrorDialog());
    } else if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      // canLaunch gives false, idk y
      await launch(widget.downloadLink);

      // if (await canLaunch(widget.downloadLink)) {
      //   await launch(widget.downloadLink);
      // } else {
      //   showDialog(
      //       context: context,
      //       builder: (context) => GeneralDialogs(
      //           title: "حدث خطأ اثناء التنزيل",
      //           content: "الرجاء المحاولة مرة اخري"));
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
        appBar: new AppBar(
          title: new Text(
            widget.title,
            style: new TextStyle(
                color: Night_Mode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.file_download,
                color: Night_Mode ? Colors.white : Colors.black,
                size: 22,
              ),
              tooltip: "تحميل",
              onPressed: _launchURL,
            ),
          ],
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // The Image
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Night_Mode
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: Offset(5, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: new Image.asset(
                  "lib/Images/musicicon.jpg",
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
              ),
            ),
            // Text of Name and Singer
            new Text(
              widget.title,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Night_Mode ? Colors.white : Colors.black),
            ),
            new Text(
              widget.singer,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: 16,
                  color: Night_Mode ? Colors.white60 : Colors.black54),
            ),
            // The Slider and the durations text
            new Wrap(
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.spaceAround,
              alignment: WrapAlignment.spaceAround,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                new Text(
                  "${widget._position.inMinutes}:${(widget._position.inSeconds % 60)}",
                  style: new TextStyle(
                      color: Night_Mode ? Colors.white : Colors.black),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width - 110,
                  child: new Slider(
                      value: widget._position.inSeconds.toDouble(),
                      activeColor: Color.fromRGBO(178, 77, 146, 0.9),
                      inactiveColor: Color.fromRGBO(151, 81, 149, 0.9),
                      min: 0,
                      max: widget._duration.inSeconds.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          widget._audioPlayer
                              .seek(Duration(seconds: value.toInt()));
                          value = value;
                        });
                      }),
                ),
                new Text(
                  "${widget._duration.inMinutes}:${widget._duration.inSeconds % 60}",
                  style: new TextStyle(
                      color: Night_Mode ? Colors.white : Colors.black),
                )
              ],
            ),
            // The Play button and the seeks
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new ClipOval(
                    child: Material(
                      color: Night_Mode
                          ? Color.fromRGBO(98, 71, 136, 0.9)
                          : Color.fromRGBO(155, 81, 148, 1), // button color
                      child: InkWell(
                        splashColor: Color.fromRGBO(100, 73, 137, 1),
                        // inkwell color
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.replay_10,
                            size: 25,
                            color: Night_Mode ? Colors.black : Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            widget._audioPlayer
                                .seek(widget._position - Duration(seconds: 10));
                          });
                        },
                      ),
                    ),
                  ),
                ),
                _playing
                    ? ClipOval(
                        child: Material(
                          color: Night_Mode
                              ? Color.fromRGBO(98, 71, 136, 0.9)
                              : Color.fromRGBO(155, 81, 148, 1), // button color
                          child: InkWell(
                            splashColor: Color.fromRGBO(100, 73, 137, 1),
                            // inkwell color
                            child: SizedBox(
                                width: 70,
                                height: 70,
                                child: new Center(
                                  child: Icon(
                                    Icons.pause,
                                    size: 45,
                                    color: Night_Mode
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                )),
                            onTap: () {
                              setState(() {
                                pause();
                              });
                            },
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Material(
                          color: Night_Mode
                              ? Color.fromRGBO(98, 71, 136, 0.9)
                              : Color.fromRGBO(155, 81, 148, 1), // button color
                          child: InkWell(
                            splashColor: Color.fromRGBO(100, 73, 137, 1),
                            // inkwell color
                            child: SizedBox(
                                width: 70,
                                height: 70,
                                child: new Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 45,
                                    color: Night_Mode
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                )),
                            onTap: () {
                              setState(() {
                                play();
                              });
                            },
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new ClipOval(
                    child: Material(
                      color: Night_Mode
                          ? Color.fromRGBO(98, 71, 136, 0.9)
                          : Color.fromRGBO(155, 81, 148, 1), // button color
                      child: InkWell(
                        splashColor: Color.fromRGBO(100, 73, 137, 1),
                        // inkwell color
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.forward_10,
                            size: 25,
                            color: Night_Mode ? Colors.black : Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            widget._audioPlayer
                                .seek(widget._position + Duration(seconds: 10));
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
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

  void play() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
          context: context, builder: (context) => AudioWifiErrorDialog());
    } else if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      if (widget._audioPlayer.state == PlayerState.PAUSED)
        pause();
      else {
        stopAll();
        int result =
            await widget._audioPlayer.play(widget.audiolink, stayAwake: true);
        if (result == 1) {
          setState(() {
            widget._audioPlayer.seek(widget._position);
            _playing = true;
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
      if (widget._audioPlayer.state == PlayerState.PLAYING) {
        setState(() {
          _playing = false;
          widget._audioPlayer.pause();
        });
      } else if (widget._audioPlayer.state == PlayerState.PAUSED) {
        setState(() {
          _playing = true;
          widget._audioPlayer.resume();
        });
      }
    });
  }

  void stopAll() {
    setState(() {
      AudioPlayer _LocalAudioPlayer;
      for (int i = 0; i < NumberOfEnshadPlayers; i++) {
        if (i != widget.index) {
          _LocalAudioPlayer = AudioPlayer(playerId: "Enshad${i}");
          _LocalAudioPlayer.stop();
        }
      }
    });
  }
}

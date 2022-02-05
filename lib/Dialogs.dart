import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AhzabAudioDialog extends StatefulWidget {
  double firstpage;
  double lastpage;

  AhzabAudioDialog({
    required this.firstpage,
    required this.lastpage,
  });

  @override
  _AhzabAudioDialogState createState() => _AhzabAudioDialogState();
}

class _AhzabAudioDialogState extends State<AhzabAudioDialog> {
  late double page;

  @override
  void initState() {
    page = widget.firstpage;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _dialog() {
    if (Platform.isAndroid) {
      return new AlertDialog(
          title: new Text("موافق ؟",
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              )),
          content: new Wrap(
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text("سوف يتم تشغيل الصوت عبر الانترنت",
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: new TextStyle(
                        fontWeight: FontWeight.w400,
                      )),
                  new Column(
                    children: <Widget>[
                      new Text("البدء من الصفحة ${page.toInt().toString()}"),
                      new Slider.adaptive(
                        value: page,
                        onChanged: (val) => setState(() => page = val),
                        min: widget.firstpage,
                        max: widget.lastpage,
                        divisions: (widget.lastpage - widget.firstpage).toInt(),
                        label: "${page.toInt().toString()}",
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                child: new Text("غير موافق",
                    style: new TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            new FlatButton(
                child: new Text("بدء",
                    style: new TextStyle(color: Colors.lightBlue)),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context, page);
                  });
                })
          ]);
    } else {
      return new CupertinoAlertDialog(
          title: new Text("موافق ؟",
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              )),
          content: new Wrap(
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text("سوف يتم تشغيل الصوت عبر الانترنت",
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: new TextStyle(
                        fontWeight: FontWeight.w400,
                      )),
                  new Column(
                    children: <Widget>[
                      new Text("البدء من الصفحة ${page.toInt().toString()}"),
                      new Slider.adaptive(
                        value: page,
                        onChanged: (val) => setState(() => page = val),
                        min: widget.firstpage,
                        max: widget.lastpage,
                        divisions: (widget.lastpage - widget.firstpage).toInt(),
                        label: "${page.toInt().toString()}",
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                child: new Text("غير موافق",
                    style: new TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            new FlatButton(
                child: new Text("بدء",
                    style: new TextStyle(color: Colors.lightBlue)),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context, page);
                  });
                })
          ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _dialog();
  }
}

class AudioWifiErrorDialog extends StatefulWidget {
  @override
  _AudioWifiErrorDialogState createState() => _AudioWifiErrorDialogState();
}

class _AudioWifiErrorDialogState extends State<AudioWifiErrorDialog> {
  @override
  void dispose() {
    super.dispose();
  }

  _dialog() {
    if (Platform.isAndroid) {
      return new AlertDialog(
          title: new Text("فشل الاتصال بالانترنت",
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          content: new Wrap(children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: new Text("الرجاء الاتصلات بالانترنت ثم حاول مجددا",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ]),
          actions: <Widget>[
            new FlatButton(
                child:
                    new Text("موافق", style: new TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ]);
    } else {
      return new CupertinoAlertDialog(
          title: new Text("فشل الاتصال بالانترنت",
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          content: new Wrap(children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: new Text("الرجاء الاتصلات بالانترنت ثم حاول مجددا",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ]),
          actions: <Widget>[
            new FlatButton(
                child:
                    new Text("موافق", style: new TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _dialog();
  }
}

class AudioErrorDialog extends StatefulWidget {
  @override
  _AudioErrorDialogState createState() => _AudioErrorDialogState();
}

class _AudioErrorDialogState extends State<AudioErrorDialog> {
  @override
  void dispose() {
    super.dispose();
  }

  _dialog() {
    if (Platform.isAndroid) {
      return new AlertDialog(
          title: new Text("حدث خطأ اثناء التشغيل",
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          content: new Wrap(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: new Text("احاول مجدد مره لاحقها",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: new TextStyle(
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                child:
                    new Text("موافق", style: new TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ]);
    } else {
      return new CupertinoAlertDialog(
          title: new Text("حدث خطأ اثناء التشغيل",
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          content: new Wrap(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: new Text("احاول مجدد مره لاحقها",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: new TextStyle(
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                child:
                    new Text("موافق", style: new TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _dialog();
  }
}

class WerdOnStart extends StatefulWidget {
  @override
  _WerdOnStartState createState() => _WerdOnStartState();
}

class _WerdOnStartState extends State<WerdOnStart> {
  @override
  void dispose() {
    super.dispose();
  }

  _dialog() {
    if (Platform.isAndroid) {
      return AlertDialog(
        title: new Text("لم تكمل الورد",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        content: new Wrap(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: new Text("ترد نكملة الورد ؟",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                  )),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: new Text("تكمله", style: new TextStyle(color: Colors.blue)),
            onPressed: () {
              setState(() {
                Navigator.pop(context, true);
              });
            },
          ),
          FlatButton(
              child: new Text("بدء من جديد",
                  style: new TextStyle(color: Colors.blue)),
              onPressed: () {
                setState(() {
                  Navigator.pop(context, false);
                });
              })
        ],
      );
    } else {
      return CupertinoAlertDialog(
        title: new Text("لم تكمل الورد",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        content: new Wrap(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: new Text("ترد نكملة الورد ؟",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                  )),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: new Text("تكمله", style: new TextStyle(color: Colors.blue)),
            onPressed: () {
              setState(() {
                Navigator.pop(context, true);
              });
            },
          ),
          FlatButton(
              child: new Text("بدء من جديد",
                  style: new TextStyle(color: Colors.blue)),
              onPressed: () {
                setState(() {
                  Navigator.pop(context, false);
                });
              })
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _dialog();
  }
}

class WerdOnEndDialog extends StatefulWidget {
  @override
  _WerdOnEndDialogState createState() => _WerdOnEndDialogState();
}

class _WerdOnEndDialogState extends State<WerdOnEndDialog> {
  @override
  void dispose() {
    super.dispose();
  }

  _dialog() {
    if (Platform.isAndroid) {
      return AlertDialog(
        title: new Text("لقد اتمت الورد بحمد الله",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            )),
        actions: <Widget>[
          FlatButton(
            child: new Text("الحمد لله"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    } else {
      return CupertinoAlertDialog(
        title: new Text("لقد اتمت الورد بحمد الله",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            )),
        actions: <Widget>[
          FlatButton(
            child: new Text("الحمد لله"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _dialog();
  }
}

class NightMode extends StatefulWidget {
  bool Night_Mode;

  NightMode({
    required this.Night_Mode,
  });

  @override
  _NightModeState createState() => _NightModeState();
}

class _NightModeState extends State<NightMode> {
  late String text;

  @override
  void initState() {
    super.initState();
    text = widget.Night_Mode ? "تفعيل الوضع الليلى" : "الغاء الوضع الليلي";
  }

  @override
  void dispose() {
    super.dispose();
  }

  _dialog() {
    if (Platform.isAndroid) {
      return AlertDialog(
        title: new Text("$text",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            )),
        content: new Text(
          " سوف يتم $text في المره القادمة التى سوف تقوم فيها بفتح التطبيق",
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        actions: <Widget>[
          FlatButton(
            child: new Text("موافق"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    } else {
      return CupertinoAlertDialog(
        title: new Text("$text",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            )),
        content: new Text(
          " سوف يتم $text في المره القاده التى سوف تقوم فيها بفتح التطبيق",
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        actions: <Widget>[
          FlatButton(
            child: new Text("موافق"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _dialog();
  }
}

class GeneralDialogs extends StatefulWidget {
  String title, content;

  GeneralDialogs({
    required this.title,
    required this.content,
  });

  @override
  _GeneralDialogsState createState() => _GeneralDialogsState();
}

class _GeneralDialogsState extends State<GeneralDialogs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _dialog() {
    if (Platform.isAndroid) {
      return AlertDialog(
        title: new Text(widget.title,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            )),
        content: new Text(
          widget.content,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        actions: <Widget>[
          FlatButton(
            child: new Text("موافق"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    } else {
      return CupertinoAlertDialog(
        title: new Text(widget.title,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            )),
        content: new Text(
          widget.content,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        actions: <Widget>[
          FlatButton(
            child: new Text("موافق"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _dialog();
  }
}

// class NotificationsDialog extends StatefulWidget {
//   @override
//   _NotificationsDialogState createState() => _NotificationsDialogState();
// }
//
// class _NotificationsDialogState extends State<NotificationsDialog> {
//   late Time time;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//  /* _dialog() {
//     if (Platform.isAndroid) {
//       return new AlertDialog(
//           title: new Text("اختر الميعاد",
//               textAlign: TextAlign.right,
//               textDirection: TextDirection.rtl,
//               style: new TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent,
//               )),
//           content: new TimePickerSpinner(
//             isShowSeconds: false,
//             is24HourMode: false,
//             normalTextStyle: TextStyle(fontSize: 24, color: Colors.black),
//             highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.blue),
//             spacing: 50,
//             itemHeight: 80,
//             isForce2Digits: false,
//             onTimeChange: (Times) {
//               setState(() {
//                 time = Times as Time;
//                 print(Times);
//                 print(time);
//               });
//             },
//           ),
//           actions: <Widget>[
//             new FlatButton(
//                 child: new Text("موافق",
//                     style: new TextStyle(color: Colors.lightBlue)),
//                 onPressed: () {
//                   setState(() {
//                     Navigator.pop(context, time);
//                   });
//                 })
//           ]);
//     } else {
//       return new CupertinoAlertDialog(
//           title: new Text("اختر الميعاد",
//               textAlign: TextAlign.right,
//               textDirection: TextDirection.rtl,
//               style: new TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent,
//               )),
//           content: new TimePickerSpinner(
//             is24HourMode: false,
//             normalTextStyle: TextStyle(fontSize: 24, color: Colors.deepOrange),
//             highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.yellow),
//             spacing: 50,
//             itemHeight: 80,
//             isForce2Digits: true,
//             onTimeChange: (Times) {
//               setState(() {
//                 time = Times as Time;
//               });
//             },
//           ),
//           actions: <Widget>[
//             new FlatButton(
//                 child: new Text("موافق",
//                     style: new TextStyle(color: Colors.lightBlue)),
//                 onPressed: () {
//                   setState(() {
//                     Navigator.pop(context, time);
//                   });
//                 })
//           ]);
//     }
//   }*/
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

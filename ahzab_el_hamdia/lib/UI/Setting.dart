import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../Dialogs.dart';
import '../Constants.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool Night_Mode;
  bool Morning_Notification;
  bool Evening_Notification;
  Time Morning_time;
  Time Evening_time;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  @override
  void initState() {
    super.initState();
    read();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        backgroundColor: Night_Mode ? DarkModeBlack : Colors.white,
        appBar: new AppBar(
          title: new Text(
            "الاعدادات",
            style: new TextStyle(
                color: Night_Mode ? Colors.white : DarkModeBlack,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Night_Mode ? Colors.black38 : Colors.white,
        ),
        body: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: new RaisedButton(
                  color: Colors.white30,
                  onPressed: () {
                    setState(() {
                      EnableNightMode(!Night_Mode);
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: Night_Mode,
                        onChanged: EnableNightMode,
                      ),
                      new Text(
                        Night_Mode
                            ? "الغاء الوضع الليلي"
                            : "تفعيل الوضع الليلى",
//                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Night_Mode ? Colors.white : DarkModeBlack),
                      ),
                    ],
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: Night_Mode ? Colors.white54 : DarkModeBlack)),
                ),
              ),
//              new Container(
//                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                child: new RaisedButton(
//                  color: Colors.white30,
//                  onPressed: () {
//                    setState(() {
//                      EnableMorningNotification(!Morning_Notification);
//                    });
//                  },
//                  child: Row(
//                    mainAxisSize: MainAxisSize.max,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Checkbox(
//                        value: Morning_Notification,
//                        onChanged: EnableMorningNotification,
//                      ),
//                      new Text(
//                        "التذكير بالورد الصباحي",
////                        textDirection: TextDirection.rtl,
//                        textAlign: TextAlign.center,
//                        style: new TextStyle(
//                            fontWeight: FontWeight.bold,
//                            fontSize: 22,
//                            color: Night_Mode ? Colors.white : DarkModeBlack),
//                      ),
//                    ],
//                  ),
//                  shape: new RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(10),
//                      side: BorderSide(
//                          color: Night_Mode ? Colors.white54 : DarkModeBlack)),
//                ),
//              ),
//              new Container(
//                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                child: new RaisedButton(
//                  color: Colors.white30,
//                  onPressed: () {
//                    setState(() {
//                      EnableEveningNotification(!Evening_Notification);
//                    });
//                  },
//                  child: Row(
//                    mainAxisSize: MainAxisSize.max,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Checkbox(
//                        value: Evening_Notification,
//                        onChanged: EnableEveningNotification,
//                      ),
//                      new Text(
//                        "التذكير بالورد المسائي",
////                        textDirection: TextDirection.rtl,
//                        textAlign: TextAlign.center,
//                        style: new TextStyle(
//                            fontWeight: FontWeight.bold,
//                            fontSize: 22,
//                            color: Night_Mode ? Colors.white : DarkModeBlack),
//                      ),
//                    ],
//                  ),
//                  shape: new RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(10),
//                      side: BorderSide(
//                          color: Night_Mode ? Colors.white54 : DarkModeBlack)),
//                ),
//              ),
//             /* new Align(
//                alignment: Alignment.topRight,
//                child: Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
//                  child: new Text(
//                    "اهداء الفقير: زياد حسن عبد المقصود",
//                    style: new TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w300,),
//                    textAlign: TextAlign.right,
//                    textDirection: TextDirection.rtl,
//                  ),
//                ),
//              )*/
            ]),
      ),
    );
  }

  void EnableNightMode(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setBool('Night_Mode', value);
      showDialog(
          context: context,
          builder: (context) => NightMode(
                Night_Mode: preferences.getBool('Night_Mode'),
              ));
    });
  }

  void read() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Night_Mode = preferences.getBool('Night_Mode') ?? false;
      Morning_Notification =
          preferences.getBool("Morning_Notification") ?? false;
      Evening_Notification =
          preferences.getBool("Evening_Notification") ?? false;
    });

    androidInitializationSettings = AndroidInitializationSettings('app_icon');
    iosInitializationSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        androidInitializationSettings, iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: OnSelectedNotification);
  }

  void ShowMorningNotifications() async {
    await MorningNotification();
  }

  Future<void> MorningNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("Morning Text", "Morning", "Morning",
            priority: Priority.High,
            importance: Importance.Max,
            ticker: "Morning");
    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        "تذكير بالورد الصباحي",
        "اضغط لفتح التطبيق",
        Morning_time,
        notificationDetails);
  }

  void ShowEveningNotifications() async {
    await EveningNotification();
  }

  Future<void> EveningNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("Evening Text", "Evening", "Evening",
            priority: Priority.High,
            importance: Importance.Max,
            ticker: "Evening");
    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        1,
        "تذكير بالورد المسائي",
        "اضغط لفتح التطبيق",
        Evening_time,
        notificationDetails);
  }

  Future OnSelectedNotification(String payload) async {
    /*    if (payload != null) {
      print(payload);
    }
   await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Werd()),
    );*/
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: new Text(title),
      content: new Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("object");
            },
            child: new Text("Okay"))
      ],
    );
  }

  void EnableMorningNotification(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (value == false) {
      await flutterLocalNotificationsPlugin.cancel(0);
      setState(() {
        preferences.setBool("Morning_Notification", value);
        Morning_Notification = value;
      });
    } else {
      DatePicker.showTime12hPicker(context,
          currentTime: DateTime.now(),
          showTitleActions: true,
          locale: LocaleType.ar, onConfirm: (date) {
        Morning_time = Time(date.hour, date.minute, 0);
        ShowMorningNotifications();
        setState(() {
          preferences.setBool('Morning_Notification', value);
          Morning_Notification = value;
        });
      }, onCancel: () {
        setState(() {
          preferences.setBool('Morning_Notification', false);
          Morning_Notification = false;
        });
      });
    }
  }

  void EnableEveningNotification(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (value == false) {
      await flutterLocalNotificationsPlugin.cancel(1);
      setState(() {
        preferences.setBool("Evening_Notification", value);
        Evening_Notification = value;
      });
    } else {
      DatePicker.showTime12hPicker(context,
          currentTime: DateTime.now(),
          showTitleActions: true,
          locale: LocaleType.ar, onConfirm: (date) {
        Evening_time = Time(date.hour, date.minute, 0);
        ShowEveningNotifications();
        setState(() {
          preferences.setBool('Evening_Notification', true);
          Evening_Notification = true;
        });
      }, onCancel: () {
        setState(() {
          preferences.setBool('Evening_Notification', false);
          Evening_Notification = false;
        });
      });
    }
  }
}

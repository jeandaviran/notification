import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin2;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin2 = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        selectNotification: onSelectNotification);
    flutterLocalNotificationsPlugin2.initialize(initSetttings, selectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Local Notification'),
      ),
      body: new Center(
        child: new Column(
 children: <Widget>[
   new RaisedButton(
     onPressed: show1,
     child: new Text(
       'Demo',
       style: Theme.of(context).textTheme.headline,
     ),
   ),
   new RaisedButton(
     onPressed: show2,
     child: new Text(
       'Demo',
       style: Theme.of(context).textTheme.headline,
     ),
   ),
 ],
        )
      ),
    );
  }

  show1() async{
    print('presiono');
    bool result = true;
    if(result) {
      var time = new Time(17, 47, 0);
      var androidPlatformChannelSpecifics =
      new AndroidNotificationDetails('repeatDailyAtTime channel id',
          'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
      var iOSPlatformChannelSpecifics =
      new IOSNotificationDetails();
      var platformChannelSpecifics = new NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.showDailyAtTime(
          0,
          'show daily title',
          'Daily notification shown at approximately',
          time,
          platformChannelSpecifics);
    }
  }

  show2() async{
    bool result = true;
    if(result == false){
      var time = new Time(17, 49, 0);
      var androidPlatformChannelSpecifics =
      new AndroidNotificationDetails('repeatDailyAtTime channel id 2',
          'repeatDailyAtTime channel name 1', 'repeatDailyAtTime description');
      var iOSPlatformChannelSpecifics =
      new IOSNotificationDetails();
      var platformChannelSpecifics = new NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin2.showDailyAtTime(
          1,
          'show daily title',
          'Daily notification shown at approximately',
          time,
          platformChannelSpecifics);
    }
  }

/*  String _toTwoDigitString(int value) {
    return value.toString().padLeft(2, '0');
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,importance: Importance.Max
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'New Video is out', 'Flutter Local Notification', platform,
        payload: 'Nitish Kumar Singh is part time Youtuber');
  }*/
}

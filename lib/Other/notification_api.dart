import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi{


  static late FlutterLocalNotificationsPlugin _notification;

  NotificationApi._() {
    init();
  }

  init() async {
    _notification = FlutterLocalNotificationsPlugin();
    initializePlatformSpecifics();   }
    
    initializePlatformSpecifics(){
    var initSettingAndroid = AndroidInitializationSettings('app_notf_icon');
    }
  

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails()
    );
  }

  static Future showNotification({
  int id = 0,
  String? title, 
  String? body,
  String? payload,
}) async =>
      _notification.show(id, title, body, await _notificationDetails(),payload: payload);
}
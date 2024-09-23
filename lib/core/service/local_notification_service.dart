import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../data/task_model.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
     static StreamController<NotificationResponse> streamController = StreamController();

  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);

  }

  static Future<void> init() async {
    const InitializationSettings settings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //Basic Notification
  static void showBasicNotification() async {
    const NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails("id 1", "basic notification",
            importance: Importance.max, priority: Priority.max));
    await flutterLocalNotificationsPlugin
        .show(0, "Basic Notification", "Helooo", details, payload: "data");
  }

  static void showRepeatingNotification() async {
    const NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails("id 2", "repeating notification",
            importance: Importance.max, priority: Priority.max));
    await flutterLocalNotificationsPlugin.periodicallyShow(0,
        "repeating Notification", "Helooo", RepeatInterval.everyMinute, details,
        payload: "data");
  }

  static void showScheduledNotification() async {
    UILocalNotificationDateInterpretation
        uiLocalNotificationDateInterpretation =
        UILocalNotificationDateInterpretation.absoluteTime;

    const NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails("id 3", "Scheduled notification",
            importance: Importance.max, priority: Priority.max));
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();

    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    print("showScheduledNotification "+tz.local.name);

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, now.hour , 57);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        "Scheduled Notification",
        "Helooo Hazem",

        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10))
       scheduledDate
        
        ,
        details,
        uiLocalNotificationDateInterpretation:
            uiLocalNotificationDateInterpretation);
  }


    static void showDailyScheduledNotification() async {
    UILocalNotificationDateInterpretation
        uiLocalNotificationDateInterpretation =
        UILocalNotificationDateInterpretation.absoluteTime;

    const NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails("id 4", "Daily notification",
            importance: Importance.max, priority: Priority.max));
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();

    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    print("showScheduledNotification "+tz.local.name);

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, now.hour , 19);

    await flutterLocalNotificationsPlugin.zonedSchedule(
       3,
        "Daily Notification",
        "Helooo Hazem",

        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10))
       scheduledDate
        
        ,
        details,
        uiLocalNotificationDateInterpretation:
            uiLocalNotificationDateInterpretation);
  }




   static void scheduleDailyNotification() async {
    const androidPlatformChannelSpecifics =  AndroidNotificationDetails(
        'daily_notification_channel_id', 'daily_notification',
        importance: Importance.max,
        priority: Priority.high);
    const platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,9);
    if (scheduledDate.isBefore(now)) {
      print(tz.local.name);
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'عنوان الإشعار',
      'هذا هو نص الإشعار الذي سيظهر يوميًا الساعة 9 صباحًا',
      scheduledDate,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }


    //showDailySchduledNotification
  static void showDailySchduledNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'daily schduled notification',
      'id 4',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = const NotificationDetails(
      android: android,
    );
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    var currentTime = tz.TZDateTime.now(tz.local);
    log("currentTime.year:${currentTime.year}");
    log("currentTime.month:${currentTime.month}");
    log("currentTime.day:${currentTime.day}");
    log("currentTime.hour:${currentTime.hour}");
    log("currentTime.minute:${currentTime.minute}");
    log("currentTime.second:${currentTime.second}");
    var scheduleTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      currentTime.hour,
      35,
    );
    log("scheduledTime.year:${scheduleTime.year}");
    log("scheduledTime.month:${scheduleTime.month}");
    log("scheduledTime.day:${scheduleTime.day}");
    log("scheduledTime.hour:${scheduleTime.hour}");
    log("scheduledTime.minute:${scheduleTime.minute}");
    log("scheduledTime.second:${scheduleTime.second}");
    if (scheduleTime.isBefore(currentTime)) {
      scheduleTime = scheduleTime.add(const Duration(hours: 1));
      log("AfterAddedscheduledTime.year:${scheduleTime.year}");
      log("AfterAddedscheduledTime.month:${scheduleTime.month}");
      log("AfterAddedscheduledTime.day:${scheduleTime.day}");
      log("AfterAddedscheduledTime.hour:${scheduleTime.hour}");
      log("AfterAddedscheduledTime.minute:${scheduleTime.minute}");
      log("AfterAddedscheduledTime.second:${scheduleTime.second}");
      log('Added Duration to scheduled time');
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      'Daily Schduled Notification',
      'body',
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      scheduleTime,
      details,
      payload: 'zonedSchedule',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static void showTaskNotification(
      {required DateTime currentDate,
      required TimeOfDay scheduledTime,
      required TaskModel taskModel}) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'task notification',
      'task',
    );
    NotificationDetails details = const NotificationDetails(
      android: android,
    );
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
        log("currentTime.year:${currentDate.year}");
    log("currentTime.month:${currentDate.month}");
    log("currentTime.day:${currentDate.day}");
    log("currentTime.hour:${scheduledTime.hour}");
    log("currentTime.minute:${scheduledTime.minute}");
    await flutterLocalNotificationsPlugin.zonedSchedule(
      taskModel.id,
      taskModel.title,
      taskModel.note,
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      tz.TZDateTime(
        tz.local,
        currentDate.year,
        currentDate.month,
        currentDate.day,
        scheduledTime.hour,
        scheduledTime.minute,
      ).subtract(const Duration(minutes: 1)),
      details,
      payload: 'Title: ${taskModel.title}  , Note: "${taskModel.note}',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }



  static void cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

    static void cancelTaskNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}

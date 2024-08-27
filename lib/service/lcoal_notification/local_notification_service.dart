import 'dart:async';
import 'dart:developer';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      // we  put Icon specialist for android
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static void showBasicNotification() async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
          importance: Importance.max,
          priority: Priority.high,
          "id 1", //channel id
          "basic notification ",
          sound: RawResourceAndroidNotificationSound(
              'sally.mp3'.split('.').first)),
    );
    await flutterLocalNotificationsPlugin.show(
        0, //id
        "Basic Notification", //title
        "Body Notification", //body
        details,
        payload: "Payload Data");
  }

  static void showRepeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        // line 27 and 28 to show notification above screen
        //delte storage before add two this line
        importance: Importance.max,
        priority: Priority.high,
        "id 2", //channel id
        "Repeated notification ", //cahnnel name
      ),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
        1, //id
        "Repeated Notification", //title
        "Repeated Body", //body
        RepeatInterval.everyMinute,
        details,
        payload: "Payload Data");
  }

  static void showScheduledNotification() async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
          importance: Importance.max,
          priority: Priority.high,
          "id 3", //channel id
          "Scheduled notification ", //Channel name
          sound: RawResourceAndroidNotificationSound(
              'sally.mp3'.split('.').first)),
    );

    tz.initializeTimeZones();

    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();

    log("Before location ${tz.local.name} , hour : ${tz.TZDateTime.now(tz.local).hour.toString()} , minute : ${tz.TZDateTime.now(tz.local).minute.toString()}");
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    log("After location ${tz.local.name} , hour : ${tz.TZDateTime.now(tz.local).hour.toString()} , minute : ${tz.TZDateTime.now(tz.local).minute.toString()}");
    /*
 tz.TZDateTime(
          tz.local,  // Timezone
          2024,      // Year
          8,         // Month (February)
          25,         // Day
          15,         // Hour
          5,
        ),           */
    await flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        "Scheduled Notification",
        "Body Scheduled ",
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 3)),
        details,
        payload: "Zone scheduled",
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static void showDailyScheduledNotification() async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
          importance: Importance.max,
          priority: Priority.high,
          "id 4", //channel id
          "Daily Scheduled notification ", //Channel name
          sound: RawResourceAndroidNotificationSound(
              'sally.mp3'.split('.').first)),
    );

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    var currentTime =tz.TZDateTime.now(tz.local);
    var scheduledTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      59, // The minute you want to schedule
    );

    // If the scheduled time is in the past, move it to the next day
    if (scheduledTime.isBefore(currentTime)) {
      log("$scheduledTime");
      scheduledTime = scheduledTime.add(const Duration(days: 1));
      log("$scheduledTime");
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
         3,
        "Daily Scheduled Notification",
        "Body Scheduled ",
        scheduledTime,
        details,
        payload: "Zone scheduled",
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);

  }

  static void cancelNotification({required int id}) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static void cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  // Request notification permission on Android 13 and higher
  static requestPermission() {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }
}

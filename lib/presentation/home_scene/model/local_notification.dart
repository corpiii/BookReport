import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  LocalNotification._();

  static final LocalNotification _localNotification = LocalNotification._();

  static LocalNotification get instance => _localNotification;

  static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // for FCM
  static String channelID = 'notification_channel';
  static String channelName = 'book alert Notifications';
  static String channelDescription = 'weekly notification';

  static Future<void> init() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    DarwinInitializationSettings iosInitializationSettings = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    // AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
    //   channelID,
    //   channelName,
    //   description: channelDescription,
    //   importance: Importance.max,
    // );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    // await flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(androidNotificationChannel);
  }

  static void requestPermission() {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> setAlert(List<bool> dateList, int alertHour, int alertMinutes) async {
    final sunday = _generateStartDate(alertHour, alertMinutes);
    final List<Future<void>> workList = [];

    dateList.asMap().entries.forEach((entry) {
      final index = entry.key;
      final value = entry.value;

      if (value == true) {
        final scheduledDate = sunday.add(Duration(days: index));

        workList.add(
          LocalNotification._flutterLocalNotificationsPlugin.zonedSchedule(
            index,
            'BookReport',
            'Time to read book',
            scheduledDate,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channelID,
                channelName,
                channelDescription: channelDescription,
                importance: Importance.max,
                priority: Priority.max,
              ),
            ),
            androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
            matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
          ),
        );
      }
    });

    await Future.wait(workList);
  }

  tz.TZDateTime _generateStartDate(int alertHour, int alertMinutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, alertHour, alertMinutes);

    while (scheduledDate.weekday != DateTime.sunday) {
      scheduledDate = scheduledDate.add(Duration(days: 1));
    }

    return scheduledDate;
  }

  Future<void> clearAlert() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApp {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static OnTap(NotificationResponse detels) {}
  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: true,
      ),
    );

    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: OnTap,
      onDidReceiveBackgroundNotificationResponse: OnTap,
    );
  }

  static void showNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        "1",
        'Ahmed',
      ),
    );
    flutterLocalNotificationsPlugin.show(
      0,
      'ahmed',
      'this is notification',
      details,
    );
  }
}

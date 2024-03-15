import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/View/pages/Add_Item.dart';

class NotificationApp {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static OnTap(NotificationResponse detels) {
    Get.to(AddItem());
  }

  static Future<void> init() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
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

  static void showNotification(String name, String body) async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        "1",
        name,
        importance: Importance.defaultImportance,
      ),
    );
    flutterLocalNotificationsPlugin.show(1, name, body, details,
        payload: 'notification');
  }
}

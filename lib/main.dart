import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:subscription_manager/Model/WorkManager/workManager.dart';
import 'package:subscription_manager/Model/notification/NotificationApp.dart';
import 'package:subscription_manager/View/pages/Add_Item.dart';
import 'View/pages/MainScreen.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }
  await Future.wait([
    NotificationApp.init(),
    WorkBackground().init(),
  ]);

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void listenToNotificationStream() {
    NotificationApp.streamnot.stream.listen(
      (event) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return  AddItem();
            },
          ),
        );
        // Get.to(
        //   () => const SubscriptionExpired(),
        // );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    listenToNotificationStream();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

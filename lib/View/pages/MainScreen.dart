import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import 'package:subscription_manager/Model/notification/NotificationApp.dart';
import 'package:subscription_manager/View/Colors/Colors.dart';
import 'package:subscription_manager/View/NavDrawar/NavDrawar.dart';
import 'package:subscription_manager/View/widget/CardView.dart';
import 'package:subscription_manager/generated/l10n.dart';

import 'Subscription_expired.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


 

 

  @override
  Widget build(BuildContext context) {
    // log('________ ${GetController().items[0].name}');
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          S.of(context).app_name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorUsed.primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // requestLocationPermission();
          NotificationApp.showNotification('name', 'body');
        },
        backgroundColor: ColorUsed.primaryColor,
        child: Icon(
          Icons.add,
          color: ColorUsed.fontColor,
        ),
      ),
      body: GetBuilder<GetController>(
        init: GetController(),
        builder: (controller) {
          controller.paginationData();
          return CardView(
            c: controller,
          );
        },
      ),
    );
  }
}

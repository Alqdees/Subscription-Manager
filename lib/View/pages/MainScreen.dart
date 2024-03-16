import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import 'package:subscription_manager/Model/DataBaseApp/DataBaseSqflite.dart';
import 'package:subscription_manager/View/Colors/Colors.dart';
import 'package:subscription_manager/View/NavDrawar/NavDrawar.dart';
import 'package:subscription_manager/View/widget/CardView.dart';
import 'package:subscription_manager/generated/l10n.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // void requestLocationPermission() async {
  //  // PermissionStatus status = await Permission.location.request();
  //   if (status.isGranted) {
  //     // Permission granted, proceed with location-related tasks
  //   } else {
  //     // Permission denied, handle accordingly
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetController>(
      init: GetController(),
      builder: (controller) {
        return Scaffold(
          drawer: const NavDrawer(),
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
              DataBaseSqflite().insertInAccount({
                DataBaseSqflite.name: 'Ahmed shaker',
                DataBaseSqflite.number: "078954",
                DataBaseSqflite.date: "2024-01-01",
                DataBaseSqflite.price: "201",
              });
            },
            backgroundColor: ColorUsed.primaryColor,
            child: Icon(
              Icons.add,
              color: ColorUsed.fontColor,
            ),
          ),
          body: const CardView(),
        );
      },
    );
  }
}

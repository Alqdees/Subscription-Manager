import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import 'package:subscription_manager/Model/DataBaseApp/DataBaseSqflite.dart';
import 'package:subscription_manager/generated/l10n.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetController>(
      init: GetController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).app_name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.teal,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.addItems({DataBaseSqflite.name: "ahmed"});
            },
          ),
        );
      },
    );
  }
}

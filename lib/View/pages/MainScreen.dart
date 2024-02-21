import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import 'package:subscription_manager/View/Colors/Colors.dart';
import 'package:subscription_manager/View/NavDrawar/NavDrawar.dart';
import 'package:subscription_manager/View/widget/CardView.dart';
import 'package:subscription_manager/generated/l10n.dart';
import 'Add_Item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetController>(
      init: GetController(),
      builder: (controller) {
        return Scaffold(
          drawer:  NavDrawer(),
          appBar: AppBar(
              title: Text(
                S.of(context).app_name,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: ColorUsed.primaryColor),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(AddItem());
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

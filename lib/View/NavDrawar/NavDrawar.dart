import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/View/Colors/Colors.dart';

import '../../generated/l10n.dart';
import '../pages/Add_Item.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({super.key});

  DateTime? date1 = DateTime(2024, 2, 24);
  // DateTime? date2 = DateTime(2022, 1, 1);

  // Calculate difference in days

  // Get the difference in days
  int? differenceInDays;

  @override
  Widget build(BuildContext context) {
    // Duration difference = date2!.difference(date1!);
    return Drawer(
      // width: 50,
      elevation: 0,
      backgroundColor: ColorUsed.primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorUsed.cardColor,
            ),
            child: Text(
              S.of(context).app_name,
              style: TextStyle(
                color: ColorUsed.fontColor,
              ),
            ),
          ),
          ListTile(
            title: Text(S.of(context).add,
                style: TextStyle(
                  color: ColorUsed.cardColor,
                )),
            leading: Icon(
              Icons.add,
              color: ColorUsed.cardColor,
            ),
            onTap: () {
              Get.to(AddItem());
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import 'package:subscription_manager/View/Colors/Colors.dart';
import 'package:subscription_manager/View/pages/Subscription_expired.dart';

import '../../generated/l10n.dart';
import '../pages/Add_Item.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              GetController().sendNotification();
              // NotificationApp.showNotification('ahmed', 'ali');
            },
          ),
          ListTile(
            title: Text('Expired User ',
                style: TextStyle(
                  color: ColorUsed.cardColor,
                )),
            leading: Icon(
              Icons.card_giftcard,
              color: ColorUsed.cardColor,
            ),
            onTap: () {
              Get.to(const SubscriptionExpired());
              // NotificationApp.showNotification('ahmed', 'ali');
            },
          ),
        ],
      ),
    );
  }
}

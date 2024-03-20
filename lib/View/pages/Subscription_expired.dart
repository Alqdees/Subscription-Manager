import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import 'package:subscription_manager/View/widget/CardExpired.dart';

import '../../generated/l10n.dart';
import '../Colors/Colors.dart';

class SubscriptionExpired extends StatelessWidget {
  const SubscriptionExpired({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).expired_user,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorUsed.primaryColor,
      ),
      body: GetBuilder<GetController>(
        builder: (controller) {
          controller.getDataFromexpired();
          return CardExpired(c: controller);
        },
      ),
    );
  }
}

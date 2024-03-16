import 'package:flutter/material.dart';
import 'package:subscription_manager/View/widget/CardView2.dart';

import '../Colors/Colors.dart';

class SubscriptionExpired extends StatelessWidget {
  const SubscriptionExpired({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subscription Expired',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorUsed.primaryColor,
      ),
      body: CardExpired(),
    );
  }
}

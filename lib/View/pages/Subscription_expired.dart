import 'package:flutter/material.dart';
import 'package:subscription_manager/View/widget/CardView2.dart';

class SubscriptionExpired extends StatelessWidget {
  const SubscriptionExpired({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: const CardExpired(),
    );
  }
}

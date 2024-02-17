import 'package:flutter/material.dart';
import 'package:subscription_manager/View/Colors/Colors.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8,
      backgroundColor: ColorUsed.primaryColor,
    );
  }
}

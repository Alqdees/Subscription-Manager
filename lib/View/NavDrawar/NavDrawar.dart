import 'package:flutter/material.dart';
import 'package:subscription_manager/View/Colors/Colors.dart';

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
      elevation: 0,
      backgroundColor: ColorUsed.primaryColor,
      child: Column(
        children: [
          Container(
            height: 80.0,
            color: Colors.redAccent,
          ),
          const SizedBox(
            height: 18.0,
          ),
          GestureDetector(
            child: const Text('Click Me -_-'),
            onTap: () {
              int a = date1!.millisecondsSinceEpoch;
              
              // differenceInDays = difference.inDays;
              print('object clicked ___  $a');
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:subscription_manager/View/widget/TextView.dart';
import '../../generated/l10n.dart';
import '../Colors/Colors.dart';

class DetailsUser extends StatelessWidget {
  const DetailsUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).details_user,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorUsed.primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            TextView(text: 'd', lable: 's'),
            const SizedBox(
              height: 20,
            ),
            TextView(text: 'd', lable: 's'),
            const SizedBox(
              height: 20,
            ),
            TextView(text: 'd', lable: 's'),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

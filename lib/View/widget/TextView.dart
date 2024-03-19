import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  TextView({super.key, this.text, this.lable});
  String? text, lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(lable!),
        Text(text!),
      ],
    );
  }
}

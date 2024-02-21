import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class TextFieldDate extends StatelessWidget {
  TextFieldDate({super.key, required this.date});

  String? date;

  TextEditingController dateControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: TextField(
          controller: dateControl,
          decoration: InputDecoration(
            hintText: date,
          ),
        ),
      ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';

import '../../Model/DataBaseApp/DataBaseSqflite.dart';
import '../../generated/l10n.dart';
import '../Colors/Colors.dart';
import '../widget/TextField.dart';

class AddItem extends StatelessWidget {
  DataBaseSqflite? data;
  DateTime? date1;
  String? _timestamp;

  TextEditingController name = TextEditingController();

  TextEditingController number = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController year = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController day = TextEditingController();
  AddItem({super.key});
  @override
  Widget build(BuildContext context) {
    data = DataBaseSqflite();

    return GetBuilder<GetController>(
      init: GetController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).add,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: ColorUsed.primaryColor,
            leading: IconButton(
              onPressed: () {
                controller.update();
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 16,
              ),
              TextFieldCustom(
                name: S.of(context).name,
                icons: Icons.person,
                text: name,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldCustom(
                name: S.of(context).number,
                icons: Icons.phone,
                text: number,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldCustom(
                name: S.of(context).price,
                icons: Icons.price_change,
                text: price,
              ),
              SizedBox(
                height: 32,
                child: Text(
                  S.of(context).date,
                  style: TextStyle(
                    color: ColorUsed.primaryColor,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: year,
                        decoration: InputDecoration(
                          hintText: S.of(context).year,
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorUsed.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Add some space between text fields
                    Expanded(
                      child: TextField(
                        controller: month,
                        decoration: InputDecoration(
                          hintText: S.of(context).month,
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorUsed.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: day,
                        decoration: InputDecoration(
                          hintText: S.of(context).day,
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorUsed.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              OutlinedButton(
                onPressed: () async {
                  date1 = DateTime(int.parse(year.text), int.parse(month.text),
                      int.parse(day.text));
                  _timestamp = date1!.millisecondsSinceEpoch.toString();
                  print('this is time stampe ______ $_timestamp');
                  controller.addItems(
                    {
                      DataBaseSqflite.name: name.text,
                      DataBaseSqflite.number: number.text,
                      DataBaseSqflite.price: price.text,
                      DataBaseSqflite.date: _timestamp,
                    },
                  );
                  name.clear();
                  number.clear();
                  price.clear();
                  year.clear();
                  month.clear();
                  day.clear();
                  controller.update();
                },
                child: Text(
                  'Add',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorUsed.fontColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}

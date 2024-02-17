import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';

import '../../Model/DataBaseApp/DataBaseSqflite.dart';
import '../../generated/l10n.dart';
import '../Colors/Colors.dart';
import '../widget/TextField.dart';

class AddItem extends StatelessWidget {
  DataBaseSqflite? data;

  TextEditingController name = TextEditingController();

  TextEditingController number = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController date = TextEditingController();

  AddItem({super.key});
  @override
  Widget build(BuildContext context) {
    data = DataBaseSqflite();
    return GetBuilder<GetController>(
      init: GetController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add Item',
              style: TextStyle(color: Colors.white),
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
            child: Center(
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
                const SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  name: S.of(context).date,
                  icons: Icons.date_range,
                  text: date,
                ),
                const SizedBox(
                  height: 18,
                ),
                OutlinedButton(
                  onPressed: () async {
                    controller.addItems(
                      {
                        DataBaseSqflite.name: name.text,
                        DataBaseSqflite.number: number.text,
                        DataBaseSqflite.price: price.text,
                        DataBaseSqflite.date: date.text,
                      },
                    );
                    name.clear();
                    number.clear();
                    price.clear();
                    date.clear();
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
          ),
        );
      },
    );
  }
}

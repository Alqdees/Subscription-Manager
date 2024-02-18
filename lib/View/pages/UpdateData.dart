import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import '../../Model/DataBaseApp/DataBaseSqflite.dart';
import '../../generated/l10n.dart';
import '../Colors/Colors.dart';
import '../widget/TextField.dart';

class UpdateData extends StatelessWidget {
  String named, numberd, priced, dated, id;
  late DataBaseSqflite data;
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController date = TextEditingController();
  UpdateData({
    super.key,
    required this.named,
    required this.numberd,
    required this.priced,
    required this.dated,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetController>(
      init: GetController(),
      builder: (controller) {
        name.text = named;
        number.text = numberd;
        price.text = priced;

        date.text = dated;
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).UpdateData,
                style: const TextStyle(color: Colors.white)),
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
                  height: 16,
                ),
                const SizedBox(
                  height: 22,
                ),
                OutlinedButton(
                  onPressed: () async {
                    controller.updateData({
                      DataBaseSqflite.name: name.text,
                      DataBaseSqflite.number: number.text,
                      DataBaseSqflite.price: price.text,
                      DataBaseSqflite.date: date.text,
                    }, id);
                    named = "";
                    numberd = "";
                    priced = "";
                    dated = "";

                    name.clear();
                    date.clear();
                    price.clear();
                    number.clear();
                  },
                  child: Text(
                    S.of(context).UpdateData,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorUsed.buttonColor,
                      fontSize: 14,
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import '../../Model/DataBaseApp/DataBaseSqflite.dart';
import '../../generated/l10n.dart';
import '../Colors/Colors.dart';
import '../widget/TextField.dart';

class UpdateData extends StatelessWidget {
  String named, numberd, priced, timestamp, id;
  DateTime? date1;
  late DataBaseSqflite data;
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController day = TextEditingController();
  UpdateData({
    super.key,
    required this.named,
    required this.numberd,
    required this.priced,
    required this.timestamp,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    date1 = DateTime.fromMillisecondsSinceEpoch(
      int.parse(timestamp),
    );
    name.text = named;
    number.text = numberd;
    price.text = priced;
    year.text = date1!.year.toString();
    month.text = date1!.month.toString();
    day.text = date1!.day.toString();
    return GetBuilder<GetController>(
      init: GetController(),
      builder: (controller) {
        // date.text = dated;
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
                  height: 22,
                ),
                OutlinedButton(
                  onPressed: () async {
                    date1 = DateTime(
                      int.parse(year.text),
                      int.parse(month.text),
                      int.parse(day.text),
                    );
                    timestamp = date1!.millisecondsSinceEpoch.toString();

                    controller.updateData(
                      {
                        DataBaseSqflite.name: name.text,
                        DataBaseSqflite.number: number.text,
                        DataBaseSqflite.price: price.text,
                        DataBaseSqflite.date: timestamp,
                      },
                      id,
                    );
                    named = "";
                    numberd = "";
                    priced = "";
                    timestamp = "";

                    name.clear();
                    year.clear();
                    month.clear();
                    day.clear();
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

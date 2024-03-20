import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import 'package:subscription_manager/generated/l10n.dart';

import '../pages/UpdateData.dart';
import 'AllItems.dart';

class CardView extends StatelessWidget {
  CardView({
    super.key,
    required this.c,
  });
  GetController c;

  @override
  Widget build(BuildContext context) {
    return c.items.isEmpty
        ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircularProgressIndicator(),
                SizedBox(
                  height: 8,
                ),
                Text('Wait'),
              ],
            ),
          )
        : Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    c.sendNotification();
                  },
                  child: ListView.builder(
                    controller: c.controller,
                    itemCount:
                        c.isLaodingMore ? c.items.length + 1 : c.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AllItems(
                        name: c.items[index].name,
                        price: c.items[index].price,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              final width = MediaQuery.of(context).size.width;
                              return AlertDialog(
                                title: Text(S.of(context).select),
                                actions: [
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                          Get.to(
                                            UpdateData(
                                              named: c.items[index].name,
                                              numberd: c.items[index].number,
                                              priced: c.items[index].price,
                                              timestamp: c.items[index].date,
                                              id: c.items[index].id,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          S.of(context).edit,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 5,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          c.deleteItem(c.items[index].id);
                                          Get.back();
                                        },
                                        child: Text(
                                          S.of(context).delete,
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 22,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
  }
}

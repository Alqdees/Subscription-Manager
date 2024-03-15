import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';

import '../../generated/l10n.dart';
import '../pages/UpdateData.dart';
import 'AllItems.dart';

class CardExpired extends StatelessWidget {
  const CardExpired({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetController>(
      builder: (controller) {
        controller.getDataFromexpired();
        return controller.expired.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
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
                    child: ListView.builder(
                      controller: controller.controller,
                      itemCount: controller.isLaodingMore
                          ? controller.expired.length + 1
                          : controller.expired.length,
                      itemBuilder: (BuildContext context, int index) {
                        // print(controller.items[index].name);
                        return AllItems(
                          name: controller.expired[index].name,
                          price: controller.expired[index].price,
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
                                                named: controller
                                                    .expired[index].name,
                                                numberd: controller
                                                    .expired[index].number,
                                                priced: controller
                                                    .expired[index].price,
                                                timestamp: controller
                                                    .expired[index].date,
                                                id: controller
                                                    .expired[index].id,
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
                                            controller.deleteItem(
                                                controller.expired[index].id);
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
                ],
              );
      },
    );
  }
}

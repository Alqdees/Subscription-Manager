import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import 'package:subscription_manager/generated/l10n.dart';
import '../pages/UpdateData.dart';
import 'AllItems.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});
  // GetController c = Get.find();
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<GetController>(
      builder: (controller) {
        controller.paginationData();
        return controller.items.isEmpty
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
                          ? controller.items.length + 1
                          : controller.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        controller.sendNotification();
                        return AllItems(
                          name: controller.items[index].name,
                          price: controller.items[index].price,
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
                                                    .items[index].name,
                                                numberd: controller
                                                    .items[index].number,
                                                priced: controller
                                                    .items[index].price,
                                                timestamp: controller
                                                    .items[index].date,
                                                id: controller.items[index].id,
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
                                                controller.items[index].id);
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

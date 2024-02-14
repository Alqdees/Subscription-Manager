import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import 'AllItems.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);
  // HomeController c = Get.find();
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
                    ]),
              )
            : Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      controller: controller.controller,
                      itemCount: controller.isLaodingMore
                          ? controller.items.length + 1
                          : controller.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AllItems(
                          name: controller.items[index].name,
                          price: controller.items[index].price,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                final width = MediaQuery.of(context).size.width;
                                return AlertDialog(
                                  title: const Text('S.of(context).select'),
                                  actions: [
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                            // Get.to(
                                            // UpdateData(
                                            //   named: controller
                                            //       .items[index].name,
                                            //   coded: controller
                                            //       .items[index].code,
                                            //   saled: controller
                                            //       .items[index].sale,
                                            //   buyt:
                                            //       controller.items[index].buy,
                                            //   quan: controller
                                            //       .items[index].quantity,
                                            //   id: controller.items[index].id,
                                            // ),
                                            // );
                                          },
                                          child: const Text(
                                            'S.of(context).edit',
                                            style: TextStyle(
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
                                            // controller.deleteItem(
                                            //     controller.items[index].id);
                                            // Get.back();
                                          },
                                          child: const Text(
                                            ' S.of(context).delete',
                                            style: TextStyle(
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

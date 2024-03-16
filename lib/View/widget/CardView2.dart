import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import '../../generated/l10n.dart';
import 'AllItems.dart';

class CardExpired extends StatelessWidget {
  CardExpired({super.key});
  final GetController c = Get.put(GetController());
  @override
  Widget build(BuildContext context) {
    c.getDataFromexpired();
    return GetBuilder<GetController>(
      builder: (controller) {
        // controller.getDataFromexpired();
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
                      itemCount: controller.expired.length,
                      itemBuilder: (BuildContext context, int index) {
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
                                          onPressed: () {},
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
                                          onPressed: () {},
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

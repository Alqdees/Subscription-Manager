import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Control/GetController.dart';
import '../../generated/l10n.dart';
import 'AllItems.dart';

class CardExpired extends StatelessWidget {
  CardExpired({
    super.key,
    required this.c,
  });
  GetController c;
  // final c = Get.put(GetController());
  @override
  Widget build(BuildContext context) {
    return c.expired.isEmpty
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
                child: GetBuilder<GetController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: c.expired.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AllItems(
                          name: c.expired[index].name,
                          price: c.expired[index].price,
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
                                          onPressed: () {
                                            c.deleteItemExpired(
                                                c.expired[index].id);
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
                    );
                  },
                ),
              ),
            ],
          );
  }
}

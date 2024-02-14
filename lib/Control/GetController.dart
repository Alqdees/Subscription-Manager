import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/DataBaseApp/DataBaseSqflite.dart';
import '../Model/Items.dart';

class GetController extends GetxController {
  List<Items> items = [];
  bool isLaodingMore = false;
  ScrollController controller = ScrollController();
  int skip = 0;
  int limit = 20;
  late DataBaseSqflite dataBaseSqflite;
  GetController() {
    dataBaseSqflite = DataBaseSqflite();
  }

  Future<void> addItems(Map<String, dynamic> data) async {
    await dataBaseSqflite.insert(data);
    update();
  }

  void paginationData() async {
    // items are list All data
    if (items.isEmpty) {
      getPData();
    }
    controller.addListener(
      () async {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          isLaodingMore = true;
          getPData();
          skip = skip + limit;
          isLaodingMore = false;
        }
      },
    );
    return null;
  }

  Future<void> getPData() async {
    var dataList = await dataBaseSqflite.getAllUser(skip, limit);
    var item = dataList
        .map((i) => Items(
              name: i![DataBaseSqflite.name].toString(),
              number: i[DataBaseSqflite.number].toString(),
              price: i[DataBaseSqflite.price].toString(),
              date: i[DataBaseSqflite.date].toString(),
              id: i[DataBaseSqflite.id].toString(),
            ))
        .toList();
    items.addAll(item);
    update();
  }
}

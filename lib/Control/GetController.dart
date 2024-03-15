import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Model/notification/NotificationApp.dart';
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
    items.clear();
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
          update();
        }
      },
    );
  }

  Future<void> updateData(
    Map<String, dynamic> data,
    String id,
  ) async {
    items.clear();
    await dataBaseSqflite.updateItem(data, id);
    paginationData();
    update();
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

  Future<void> deleteItem(String id) async {
    items.clear();
    await dataBaseSqflite.delete(id);
    update();
  }

  Future<void> sendNotification() async {
    int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(
      currentTimestamp,
    );
    DateTime dateTime2;
    Duration difference;
    for (int i = 0; i < items.length; i++) {
      dateTime2 = DateTime.fromMillisecondsSinceEpoch(
        int.parse(
          items[i].date,
        ),
      );
      difference = dateTime1.difference(dateTime2);
      if (difference.inDays == 1) {
        log(' Ahmed is work ');
        NotificationApp.showNotification(items[i].name, dateTime2.toString());
      } else {
        print('=====${difference.inDays} Noooo');
      }
    }
  }
}

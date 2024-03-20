import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subscription_manager/Model/notification/NotificationApp.dart';
import '../Model/DataBaseApp/DataBaseSqflite.dart';
import '../Model/Items.dart';
import '../View/pages/Subscription_expired.dart';

class GetController extends GetxController {
  List<Items> items = [];
  bool isLaodingMore = false;
  ScrollController controller = ScrollController();
  // ScrollController controller = ScrollController();
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

  Future<void> deleteItemExpired(String id) async {
    expired.clear();
    await dataBaseSqflite.deleteAccount(id);
    update();
  }

  Future<void> sendNotification() async {
    List dataList = await dataBaseSqflite.getAllData();

    int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(
      currentTimestamp,
    );
    DateTime dateTime2;
    Duration difference;

    for (int i = 0; i < dataList.length; i++) {
      // print('object  --- ${dataList[i][DataBaseSqflite.id]}');
      dateTime2 = DateTime.fromMillisecondsSinceEpoch(
        int.parse(
          dataList[i][DataBaseSqflite.date],
        ),
      );
      difference = dateTime1.difference(dateTime2);
      if (difference.inDays == 1) {
        log(
          'message ______ ${difference.inDays}',
        );
        NotificationApp.showNotification(
          dataList[i][DataBaseSqflite.name],
          dateTime2.toString(),
        );
      } else if (difference.inDays == 0) {
        DataBaseSqflite().insertInAccount(
          {
            DataBaseSqflite.name: dataList[i][DataBaseSqflite.name],
            DataBaseSqflite.number: dataList[i][DataBaseSqflite.number],
            DataBaseSqflite.price: dataList[i][DataBaseSqflite.price],
            DataBaseSqflite.date: dataList[i][DataBaseSqflite.date],
          },
          //  dataList[i][DataBaseSqflite.id],
        );
      }
    }
  }

  List<Items> expired = [];
  Future<void> getDataFromexpired() async {
    if (expired.isEmpty) {
      var dataList = await dataBaseSqflite.getAllDataFromAccount(
        skip,
        limit,
      );
      var item = dataList
          .map((i) => Items(
                name: i![DataBaseSqflite.name].toString(),
                number: i[DataBaseSqflite.number].toString(),
                price: i[DataBaseSqflite.price].toString(),
                date: i[DataBaseSqflite.date].toString(),
                id: i[DataBaseSqflite.id].toString(),
              ))
          .toList();
      expired.addAll(item);
      update();
    }
  }
}

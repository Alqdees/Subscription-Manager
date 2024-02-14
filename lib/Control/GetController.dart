import 'package:get/get.dart';

import '../Model/DataBaseApp/DataBaseSqflite.dart';

class GetController extends GetxController {
  late DataBaseSqflite dataBaseSqflite;
  GetController() {
    dataBaseSqflite = DataBaseSqflite();
  }

  Future<void> addItems(Map<String, dynamic> data) async {
    await dataBaseSqflite.insert(data);
print( await dataBaseSqflite.getAllUser(1, 20));   
    update();
  }
}

import 'package:subscription_manager/Model/DataBaseApp/DataBaseSqflite.dart';
import 'package:workmanager/workmanager.dart';

import '../../Control/GetController.dart';

class WorkBackground {
  static const String taskName = 'WorkBackground';
  static const String uniqueName = 'Ahmed';

  Future<void> init() async {
    await Workmanager().initialize(
      actionTask,
      isInDebugMode: false,
    );
    registerMyTask();
  }

  void registerMyTask() async {
    await Workmanager().registerPeriodicTask(
      uniqueName,
      taskName,
      frequency: const Duration(minutes: 15),
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresCharging: true,
      ),
    );
    // actionTask();
  }

  void cancelTask(String id) {
    Workmanager().cancelByUniqueName(id);
  }
}

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void actionTask() {
  Workmanager().executeTask(
    (task, inputData) {
      // if (task.contains(WorkBackground.taskName)) {
      GetController().sendNotification();
      DataBaseSqflite().insert(
        {
          DataBaseSqflite.name: 'ahmed sh',
          DataBaseSqflite.number: "01230",
          DataBaseSqflite.date: DateTime.now().millisecondsSinceEpoch,
          DataBaseSqflite.price: '1000',
        },
      );
      // }

      return Future.value(true);
    },
  );
}

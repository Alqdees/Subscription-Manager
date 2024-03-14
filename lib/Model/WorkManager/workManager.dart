import 'package:workmanager/workmanager.dart';

import '../../Control/GetController.dart';

class WorkBackground {
  Future<void> init() async {
    await Workmanager().initialize(
      actionTask,
    );
    registerMyTask();
  }

  void registerMyTask() async {
    await Workmanager().registerPeriodicTask(
      '1',
      'WorkBackground',
      // frequency: const Duration(days: 1),
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresCharging: true,
      ),
    );
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
      GetController().sendNotification();
      return Future.value(true);
    },
  );
}

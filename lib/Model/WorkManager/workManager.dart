import 'package:workmanager/workmanager.dart';
import '../../Control/GetController.dart';

class WorkBackground {
  static const String taskName = 'working';
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
      initialDelay: const Duration(minutes: 15),
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

@pragma('vm:entry-point')
void actionTask() {
  Workmanager().executeTask(
    (task, inputData) async {
      GetController().sendNotification();
      return await Future.value(true);
    },
  );
}

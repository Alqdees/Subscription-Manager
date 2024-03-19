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

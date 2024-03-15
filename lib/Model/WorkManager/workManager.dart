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
    (task, inputData) async {
      // if (task.contains(WorkBackground.taskName)) {
     await GetController().sendNotification();
    // await  DataBaseSqflite().insert(
    //     {
    //       DataBaseSqflite.name: 'ahmed sh',
    //       DataBaseSqflite.number: "01230",
    //       DataBaseSqflite.date: DateTime.now().millisecondsSinceEpoch.toString(),
    //       DataBaseSqflite.price: '1000',
    //     },
    //   );

      return await Future.value(true);
    },
  );
}

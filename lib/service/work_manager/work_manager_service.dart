import 'package:workmanager/workmanager.dart';
import '../lcoal_notification/local_notification_service.dart';

class WorkManagerService {
  void regesterMyTask() async {
    // unigue name = > عشان لو عايز اقفل التاسك دى او اعمل اى عمليات عليها

    await Workmanager().registerPeriodicTask(
      "id 1",
      "show simple notification",
      // if i need call workmanager everyday call hour
      frequency: const Duration(hours: 12),
    );
  }

  Future<void> init() async {
    await Workmanager().initialize(actionTask, isInDebugMode: true);
    regesterMyTask(); // register the task
  }

  void cancelTask({required String uniqueName}) {
    Workmanager().cancelByUniqueName(uniqueName); // The unigue name
  }

  void cancelAllTasks() {
    Workmanager().cancelAll(); // The unigue name
  }
}

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void actionTask() {
  // This is where your actual task will be performed
  // الحاجه الى هتتنفذ فى الباك جراوند
  Workmanager().executeTask(
    (taskName, inputData) {
      LocalNotificationService.showDailyScheduledNotification();
      return Future.value(true);
    },
  );
}

/*
    1- schedule notification at 9 pm
    2- execute for this notification
 */

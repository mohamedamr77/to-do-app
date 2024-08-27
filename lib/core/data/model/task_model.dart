import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String? taskName;
  @HiveField(7)
  int? id;
  @HiveField(1)
  String? taskDescriptionController;
  @HiveField(2)
  String? startDateSelectedDate;
  @HiveField(3)
  String? endDateSelectedDate;
  @HiveField(4)
  String? timeOfTask;
  @HiveField(5)
  bool archivedTask;
  @HiveField(6)
  bool doneTask;
  TaskModel(
      {required this.taskName,
      required this.taskDescriptionController,
      required this.startDateSelectedDate,
      required this.endDateSelectedDate,
      required this.timeOfTask,
      this.archivedTask = false,
      this.doneTask = false,
      this.id}) {
    this.id = DateTime.now().millisecondsSinceEpoch;
  }
}

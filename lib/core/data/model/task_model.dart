import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  TextEditingController taskName;
  @HiveField(1)
  TextEditingController taskDescriptionController;
  @HiveField(2)
  DateTime startDateSelectedDate;
  @HiveField(3)
  DateTime endDateSelectedDate;
  @HiveField(4)
  TimeOfDay timeOfTask;
  @HiveField(5)
  bool archivedTask;
  @HiveField(6)
  bool doneTask;
  TaskModel({
    required this.taskName,
    required this.taskDescriptionController,
    required this.startDateSelectedDate,
    required this.endDateSelectedDate,
    required this.timeOfTask,
    this.archivedTask = false,
    this.doneTask = false,
  });
}

import 'package:flutter/material.dart';

class TaskModel{
  TextEditingController taskName;
  TextEditingController taskDescriptionController;
  DateTime startDateSelectedDate;
  DateTime endDateSelectedDate;
  TimeOfDay timeOfTask;
  TaskModel({
    required this.taskName,
    required this.taskDescriptionController,
    required this.startDateSelectedDate,
    required this.endDateSelectedDate,
    required this.timeOfTask,
}
);
}
import 'package:flutter/material.dart';

class TaskModel{
  TextEditingController taskNameController;
  TextEditingController taskDescriptionController;
  DateTime startDateSelectedDate;
  DateTime endDateSelectedDate;
  TimeOfDay timeOfTask;
  TaskModel({
    required this.taskNameController,
    required this.taskDescriptionController,
    required this.startDateSelectedDate,
    required this.endDateSelectedDate,
    required this.timeOfTask,
}
);
}
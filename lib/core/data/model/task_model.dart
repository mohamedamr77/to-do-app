import 'package:flutter/material.dart';

class TaskModel{
  TextEditingController tasknameControllerRegester;
  TextEditingController taskDescriptionController;
  DateTime startDateSelectedDate;
  DateTime endDateSelectedDate;
  TimeOfDay timeOfTask;
  TaskModel({
    required this.tasknameControllerRegester,
    required this.taskDescriptionController,
    required this.startDateSelectedDate,
    required this.endDateSelectedDate,
    required this.timeOfTask,
}
);
}
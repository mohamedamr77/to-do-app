// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      taskName: fields[0] as String,
      taskDescriptionController: fields[1] as String,
      startDateSelectedDate: fields[2] as String,
      endDateSelectedDate: fields[3] as String,
      timeOfTask: fields[4] as String,
      archivedTask: fields[5] as bool,
      doneTask: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.taskDescriptionController)
      ..writeByte(2)
      ..write(obj.startDateSelectedDate)
      ..writeByte(3)
      ..write(obj.endDateSelectedDate)
      ..writeByte(4)
      ..write(obj.timeOfTask)
      ..writeByte(5)
      ..write(obj.archivedTask)
      ..writeByte(6)
      ..write(obj.doneTask);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

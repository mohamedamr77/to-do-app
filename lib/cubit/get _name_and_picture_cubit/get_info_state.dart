import 'dart:io';

class InfoState {}

class InfoInitialState extends InfoState {}

class NameEnterState extends InfoState {
  final String name;

  NameEnterState({required this.name});
}

class PictureEnterState extends InfoState {
  final File picture;

  PictureEnterState({required this.picture});
}

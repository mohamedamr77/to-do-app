import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:todo/cubit/get%20_name_and_picture_cubit/get_info_state.dart';

class GetInfoCubit extends Cubit<InfoState> {
  GetInfoCubit() : super(InfoInitialState());

  void setName(String name) {
    emit(NameEnterState(name: name));
  }

  void setPicture(File picture) {
    emit(PictureEnterState(picture: picture));
  }
}

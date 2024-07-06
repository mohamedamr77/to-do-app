import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:todo/cubit/get%20_name_and_picture_cubit/get_info_state.dart';

class GetInfoCubit extends Cubit<InfoState> {
  GetInfoCubit() : super(InfoInitialState()) {
    // TODO: implement GetInfoCubit
    throw UnimplementedError();
  }
  late String namePerson;
  late File picturePerson;
  void setName(String name) {
     namePerson=name;
    emit(NameEnterState(name: name));
  }

  void setPicture({required File  picture}) {
    picturePerson=picture;
    emit(PictureEnterState(picture: picture));
  }
}

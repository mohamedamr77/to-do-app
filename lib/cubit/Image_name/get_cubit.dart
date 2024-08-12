import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/Image_name/get_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetInitalUserState());
  String? name;
  File? image;
  setName({required String name}) {
    this.name = name;
    emit(NameState());
  }

  void setPhoto(File photo) {
    image = photo;
    emit(ImageState());
  }
}

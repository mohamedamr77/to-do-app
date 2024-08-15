import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo/core/box.dart';
import 'package:todo/features/regester/controller/get_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetInitalUserState());
  String? name;
  File? image;

  setName({required String name}) async {
    var box = Hive.box(BoxApp.kUserBox);
    await box.put("name", name);

    this.name = name;
    emit(NameState());
  }

  setPhoto(File photo) async {
    var box = Hive.box(BoxApp.kUserBox);
    // Store the path as a String instead of the File itself
    await box.put("image", photo.path);
    image = photo;
    emit(ImageState());
  }

  setNameFromCubit() {
    var box = Hive.box(BoxApp.kUserBox);
    name = box.get("name");
  }

  setPhotoFromCubit() {
    var box = Hive.box(BoxApp.kUserBox);
    // Retrieve the path and convert it back to a File
    String? imagePath = box.get("image");
    if (imagePath != null) {
      image = File(imagePath);
    }
  }
}

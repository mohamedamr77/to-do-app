import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/get%20_name_and_picture_cubit/get_info_state.dart';

class  GetInfoCubit extends Cubit<InfoState>{
  GetInfoCubit() : super(InfoInitialState());
   late  String name;
   getName({required String name}){
       this.name=name;
       emit(NameEnterState());
   }
   late  String picture;
  getPicture({required String picture}){
    this.picture=picture;
    emit(PictureEnterState());
  }
}
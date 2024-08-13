import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/box.dart';
import 'package:todo/cubit/theme/get_State.dart';

class GetThemeCubit extends Cubit<GetThemeState> {
  GetThemeCubit() : super(GetThemeState());
  bool isDark=false ;



  void changeTheme(bool isDark) async{
    var box= Hive.box(BoxApp.kThemeBox);
    await box.put("isDark",isDark );
    this.isDark = isDark;
    emit(ChangeThemingState());
  }


  setSwitchValueFromHive( ) {
    var box= Hive.box(BoxApp.kThemeBox);
    isDark = box.get('isDark') ?? false ;

  }


}

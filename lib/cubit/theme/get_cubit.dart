import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/theme/get_State.dart';

class GetThemeCubit extends Cubit<GetThemeState> {
  GetThemeCubit() : super(GetThemeState());
  bool isDark = false;

  void changeTheme(bool isDark) {
    this.isDark = isDark;
    emit(ChangeThemingState());
  }
}

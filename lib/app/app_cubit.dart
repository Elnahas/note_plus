import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_plus/core/helpers/shared_pref_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  bool isDark = false;

  void changeThem() async {
    isDark = !isDark;
    await SharedPrefHelper.setData("isDark" , isDark);
    emit(AppChangeThemState());
  }

  void getThem() async {
    isDark = await SharedPrefHelper.getBool("isDark");
    emit(AppChangeThemState());
  }
}

import 'package:ai_interview_coach_app/core/constants/app_constants.dart';
import 'package:ai_interview_coach_app/core/utilities/shared_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(SharedPrefs.getBool(isDarkMode));

  Future<void> changeTheme() async {
    final newTheme = !state;
    await SharedPrefs.setBool(isDarkMode, newTheme);
    emit(newTheme);
  }
}

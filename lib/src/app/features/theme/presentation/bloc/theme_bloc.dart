import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

const themeStatusKey = "THEME_STATUS";

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is InitialThemeSetEvent) {
        final bool hasDarkTheme = await isDark();
        if (hasDarkTheme) {
          emit(DarkThemeState());
        } else {
          emit(LightThemeState());
        }
      }
    });

    //while switch is clicked
    on<ThemeSwitchEvent>((event, emit) {
      final isDark = state == DarkThemeState();
      emit(isDark ? LightThemeState() : DarkThemeState());
      setTheme(isDark);
    });
  }
}

Future<bool> isDark() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(themeStatusKey) ?? true;
}

Future<void> setTheme(bool isDark) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(themeStatusKey, !isDark);
}

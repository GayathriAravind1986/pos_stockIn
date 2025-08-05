import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/Reusable/color.dart';


/// ThemeCubit Class
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: whiteColor,
    ),
    appBarTheme: const AppBarTheme(color: whiteColor),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: blackColor,
    ),
    appBarTheme: const AppBarTheme(color: blackColor),
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
    debugPrint(
        "themeColor:${state.brightness == Brightness.dark ? _lightTheme : _darkTheme}");
  }
}

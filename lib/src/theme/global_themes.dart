import 'package:flutter/material.dart';

class GlobalThemes {
  static const primary = Colors.indigo;
  static const secundary = Colors.white;
  static const thirthy = Colors.red;

  GlobalThemes();

  static final ThemeData globalThemeData = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: secundary,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: secundary,
        elevation: 0,
        shape: StadiumBorder(),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: secundary,
      shape: StadiumBorder(),
      elevation: 5,
    ),

    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(20),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(20),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(20),
        ),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => primary,
      ),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => secundary,
      ),
      trackOutlineColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => primary,
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => primary,
      ),
    ),
  );
}

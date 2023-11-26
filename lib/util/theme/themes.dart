import "package:flutter/material.dart";
import "package:personal_expense_manager/util/theme/textTheme.dart";

class Themes{
  Themes._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextThemes.lightTextTheme
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.black54,
    textTheme: TextThemes.darkTextTheme
  );
}
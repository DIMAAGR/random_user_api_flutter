import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}

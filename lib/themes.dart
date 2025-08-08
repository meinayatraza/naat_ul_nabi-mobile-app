import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    appBarTheme: const AppBarTheme(centerTitle: true),
    cardTheme: const CardTheme(elevation: 2),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.teal,
    appBarTheme: const AppBarTheme(centerTitle: true),
  );
}

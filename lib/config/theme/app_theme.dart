import 'package:flutter/material.dart';

const defaultSeedColor = Color.fromARGB(255, 32, 14, 190);

class AppTheme {
  final bool isDarkMode;
  final Color seedColor;

  AppTheme({this.isDarkMode = true, this.seedColor = defaultSeedColor});

  ThemeData get themeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      useMaterial3: true,
    );
  }
}

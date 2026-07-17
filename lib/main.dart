import 'package:flutter/material.dart';
import 'package:photo_mark/config/theme/app_theme.dart';
import 'package:photo_mark/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme().themeData, home: const HomePage());
  }
}

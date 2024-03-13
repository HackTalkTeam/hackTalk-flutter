import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/app_themes.dart';
import 'features/home/presentation/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppThemes.theme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

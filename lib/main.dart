import 'package:flutter/material.dart';
import 'package:weather_app/config/theme/app_theme.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/features/weather_info/presentation/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    sizeInitializing(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      theme: theme(),
      home: const HomePage(),
    );
  }
}

import 'package:advanc_task_3/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Theme:
  ThemeData(
      textTheme: TextTheme(
          displayLarge: TextStyle(
              color: Color.fromARGB(255, 79, 5, 5),
              fontWeight: FontWeight.w100,
              fontSize: 4)),
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 133, 9, 73)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

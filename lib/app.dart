import 'package:flutter/material.dart';
import 'package:flutter_internship/day-3/screens/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Internship",
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

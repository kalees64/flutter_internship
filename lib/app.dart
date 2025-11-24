import 'package:flutter/material.dart';
import 'package:flutter_internship/day-1/statefull_counter.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Internship",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Flutter Internship",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(child: StatefullCounter()),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class StatefullCounter extends StatefulWidget {
  const StatefullCounter({super.key});

  @override
  State<StatefullCounter> createState() => _StatefullCounterState();
}

class _StatefullCounterState extends State<StatefullCounter> {
  int count = 0;
  List<Color> colors = [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.black,
    Colors.white,
  ];
  Color color1 = Colors.green;
  Color color2 = Colors.blue;
  List<String> texts = [
    "Counter",
    "Hello",
    "World",
    "Flutter",
    "Dart",
    "I am Kalees",
  ];
  String title = "Counter";

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  void decrementCounter() {
    setState(() {
      count--;
    });
  }

  void resetCounter() {
    setState(() {
      count = 0;
      color1 = Colors.green;
      color2 = Colors.blue;
      title = "Counter";
    });
  }

  void toggleBgColor() {
    setState(() {
      color1 = colors[Random().nextInt(colors.length)];
      color2 = colors[Random().nextInt(colors.length)];
      title = texts[Random().nextInt(texts.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                title,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 180,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    IconButton(
                      onPressed: incrementCounter,
                      icon: Icon(Icons.add),
                      color: Colors.white,
                      hoverColor: Colors.black,
                      highlightColor: Colors.green,
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                    ),
                    IconButton(
                      onPressed: decrementCounter,
                      icon: Icon(Icons.remove),
                      color: Colors.white,
                      hoverColor: Colors.black,
                      highlightColor: Colors.red,
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                    ),
                    IconButton(
                      onPressed: resetCounter,
                      icon: Icon(Icons.refresh),
                      color: Colors.white,
                      hoverColor: Colors.black,
                      highlightColor: Colors.yellow,
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: toggleBgColor,
                child: Text("Toggle Bg Color"),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

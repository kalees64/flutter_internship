import 'package:flutter/material.dart';
import 'package:flutter_internship/day-2/buttun.dart';
import 'package:flutter_internship/day-3/screens/card_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToCardListScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CardListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("src/assets/images/welcome-image.png"),

                Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                VkButton(
                  width: double.infinity,
                  height: 50,
                  label: "Let's Go...",
                  color: Colors.white,
                  textColor: Colors.black,
                  onTap: () {
                    _navigateToCardListScreen(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

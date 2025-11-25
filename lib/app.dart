import 'package:flutter/material.dart';
import 'package:flutter_internship/day-2/card.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<Map<String, dynamic>> cards = [
    {
      "title": "Cool Blue Harmony",
      "description":
          "A calm, refreshing blue gradient symbolizing clarity, focus, and smooth flow—perfect for professional or productivity-focused sections.",
      "image": "src/assets/images/bg-3.png",
      "onTap": () {
        print("Blue Card Tapped");
      },
    },
    {
      "title": "Galaxy Neon Gradient Card",
      "description":
          "A vibrant blend of neon pink, purple, and cyan inspired by cosmic energy—ideal for creative, futuristic, or tech-inspired features.",
      "image": "src/assets/images/bg-2.png",
      "onTap": () {
        print("Galaxy Card Tapped");
      },
    },
    {
      "title": "Crimson Energy Burst",
      "description":
          "A bold red gradient representing strength, passion, and impact—great for urgent actions, highlights, or attention-grabbing content.",
      "image": "src/assets/images/bg-1.png",
      "onTap": () {
        print("Crimson Card Tapped");
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Internship",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Reusable Cards",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final item = cards[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: VkCard(
                          title: item["title"],
                          description: item["description"],
                          image: item["image"],
                          onTap: item["onTap"],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

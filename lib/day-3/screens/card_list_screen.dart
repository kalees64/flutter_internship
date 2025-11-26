import 'package:flutter/material.dart';
import 'package:flutter_internship/day-2/card.dart';
import 'package:flutter_internship/day-3/models/data.dart';
import 'package:flutter_internship/day-3/screens/card_detail_screen.dart';

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  void _navigateToCardDetailScreen(BuildContext context, int id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CardDetailScreen(cardId: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 238, 9, 121),
            Color.fromARGB(255, 255, 106, 0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Gradients',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                ...cards.map(
                  (card) => Hero(
                    tag: card.id,
                    child: VkCard(
                      title: card.title,
                      description: card.description,
                      image: card.image,
                      onTap: () {
                        _navigateToCardDetailScreen(context, card.id);
                      },
                    ),
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

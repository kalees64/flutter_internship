import 'package:flutter/material.dart';
import 'package:flutter_internship/day-3/models/data.dart';

class CardDetailScreen extends StatelessWidget {
  final int cardId;

  const CardDetailScreen({super.key, required this.cardId});

  @override
  Widget build(BuildContext context) {
    final GradientCard selectedCard = cards.firstWhere(
      (card) => card.id == cardId,
    );
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Image
        Hero(
          tag: selectedCard.id,
          child: Container(
            width: deviceWidth,
            height: deviceHeight * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(selectedCard.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Overlay Gradient
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: deviceWidth,
            height: deviceHeight * 0.88,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.transparent],
                stops: [0.55, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),

        // BackButton
        Container(
          padding: EdgeInsets.only(
            top: deviceHeight * 0.015,
            left: deviceWidth * 0.015,
          ),
          child: BackButton(color: Colors.white),
        ),

        // Content
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: deviceWidth,
            height: deviceHeight * 0.6,
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedCard.title,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  selectedCard.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 71, 69, 69),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

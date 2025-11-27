import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_internship/day-2/card.dart';
import 'package:flutter_internship/day-3/screens/card_detail_screen.dart';
import 'package:flutter_internship/day-3/services/gradients_service.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  List<dynamic> cardsData = [];
  bool isLoading = false;

  void _navigateToCardDetailScreen(BuildContext context, int id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CardDetailScreen(cardId: id)),
    );
  }

  // 🔹 Make this return Future<void> so it can be used by RefreshIndicator
  Future<void> getAllGradients() async {
    setState(() {
      isLoading = true;
    });

    try {
      final res = await fetchGradients();

      log('Response body ${jsonDecode(res.body)}');

      setState(() {
        cardsData = jsonDecode(res.body)['gradients'];
        isLoading = false;
      });
    } catch (e, st) {
      setState(() {
        isLoading = false;
      });
      log('Error fetching gradients: $e', stackTrace: st);
    }
  }

  @override
  void initState() {
    super.initState();
    getAllGradients();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
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
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: getAllGradients,
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),

          // 🔹 Wrap everything in RefreshIndicator
          child: RefreshIndicator(
            onRefresh: getAllGradients,
            child: isLoading
                // 🔹 Even for loading, use a scrollable so pull-to-refresh works
                ? ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const [
                      SizedBox(
                        height: 300,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      spacing: 10,
                      children: [
                        ...cardsData.map(
                          (card) => Hero(
                            tag: card["id"],
                            child: VkNetworkImageCard(
                              title: card["title"],
                              description: card["description"],
                              image: card["image"],
                              onTap: () {
                                _navigateToCardDetailScreen(
                                  context,
                                  card["id"],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

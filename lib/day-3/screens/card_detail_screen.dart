import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_internship/day-3/services/gradients_service.dart';

class CardDetailScreen extends StatefulWidget {
  const CardDetailScreen({super.key, required this.cardId});

  final int cardId;

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  late dynamic card;
  bool isLoading = false;

  Future<void> fetchCard() async {
    try {
      setState(() {
        isLoading = true;
      });
      var res = await fetchGradientById(widget.cardId);
      log('Crad response ${jsonDecode(res.body)}');
      setState(() {
        card = jsonDecode(res.body)["gradient"];
      });
    } catch (e, stackTrace) {
      log('Error fetching card: $e', error: e, stackTrace: stackTrace);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCard();
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    Uint8List? decodedImage;

    try {
      // Remove prefix if exists (data:image/png;base64,...)
      final cleaned = card["image"].contains(',')
          ? card["image"].split(',')[1]
          : card["image"];

      decodedImage = base64Decode(cleaned);
    } catch (e) {
      debugPrint("Invalid base64 image: $e");
    }

    return Stack(
      children: [
        // Image
        Hero(
          tag: widget.cardId,
          child: Container(
            width: deviceWidth,
            height: deviceHeight * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: MemoryImage(decodedImage!),
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
                  card["title"],
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
                  card["description"],
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

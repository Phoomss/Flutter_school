import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String card;
  const CardProduct({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200, // Set the height of your card
          width: 150, // Set the width of your card
          decoration: BoxDecoration(
            color: Colors.white, // Set the background color of your card
            borderRadius: BorderRadius.circular(
                8.0), // Set border radius for rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              Image.asset(
                card, // Use the provided image path
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              // Your card content goes here
              Text(
                "Product Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "\$19.99",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

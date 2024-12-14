import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the text styles using the theme colors
    var myPrimaryTextStyle =
        TextStyle(color: Colors.orange); // Primary text in orange
    var mySecondaryTextStyle =
        TextStyle(color: Colors.white); // Secondary text in white

    return Container(
      decoration: BoxDecoration(
        color: Colors.black, // Black background for the container
        border: Border.all(color: Colors.orange), // Orange border
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '\$0.99',
                style: myPrimaryTextStyle, // Orange price text
              ),
              Text(
                'Delivery Fee',
                style: mySecondaryTextStyle, // White label text
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "15-30 min",
                style: myPrimaryTextStyle, // Orange time text
              ),
              Text(
                "Delivery Time",
                style: mySecondaryTextStyle, // White label text
              ),
            ],
          )
        ],
      ),
    );
  }
}

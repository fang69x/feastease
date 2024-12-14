import 'package:feastease/Model/food.dart';
import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryTextColor = Colors.orange; // Orange for food name
    final secondaryTextColor = Colors.white; // White for price
    final descriptionColor = Colors.grey[600]; // Grey for description

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Softer rounded corners
          side: BorderSide(color: Colors.orange, width: 2), // Orange border
        ),
        elevation: 8, // Slight shadow for depth
        shadowColor: const Color.fromARGB(255, 96, 30, 5)
            .withOpacity(0.2), // Subtle shadow color
        color: const Color.fromARGB(
            255, 40, 40, 40), // Black background for the card
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              // Food details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: primaryTextColor, // Orange for food name
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${food.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: secondaryTextColor, // White for price
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      food.description,
                      style: TextStyle(
                        color: descriptionColor, // Grey for description
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(0.1), // Light background behind the image
                  ),
                  child: Image.asset(
                    food.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:feastease/components/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery In Progress"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: _buildBottomNavbar(context),
      body: Column(
        children: [
          Myreceipt(),
        ],
      ),
    );
  }
}

// Custom bottom navigation bar - message / call delivery driver
Widget _buildBottomNavbar(BuildContext context) {
  return Container(
    height: 80,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Row(
      children: [
        // Profile picture area
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
            iconSize: 30,
            constraints: BoxConstraints(
              minWidth: 50,
              minHeight: 50,
            ),
          ),
        ),
        SizedBox(width: 15),
        // Driver details
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kislay",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              Text(
                "Driver",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        // Action buttons
        Row(
          children: [
            // Message button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.message),
                color: Theme.of(context).colorScheme.primary,
                iconSize: 24,
                constraints: BoxConstraints(
                  minWidth: 45,
                  minHeight: 45,
                ),
              ),
            ),
            SizedBox(width: 10),
            // Call button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.call),
                color: Colors.green,
                iconSize: 24,
                constraints: BoxConstraints(
                  minWidth: 45,
                  minHeight: 45,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

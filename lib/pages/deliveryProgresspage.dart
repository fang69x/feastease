import 'package:feastease/Model/Restaurant.dart';
import 'package:feastease/components/my_receipt.dart';
import 'package:feastease/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  @override
  FirestoreService db = FirestoreService();

  void initState() {
    super.initState();
    // Submit order to Firestore DB
    String receipt = context.read<Restaurant>().displayCardReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery In Progress"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        elevation: 4,
        shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      ),
      bottomNavigationBar: _buildBottomNavbar(context),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "Your order is on the way!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
                child: Myreceipt()), // Ensure the component name is correct
          ],
        ),
      ),
    );
  }
}

// Custom bottom navigation bar - message / call delivery driver
Widget _buildBottomNavbar(BuildContext context) {
  return Container(
    height: 80,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Theme.of(context).colorScheme.secondary.withOpacity(0.9),
          Theme.of(context).colorScheme.secondary,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            icon: const Icon(Icons.person),
            iconSize: 32,
            constraints: const BoxConstraints(
              minWidth: 55,
              minHeight: 55,
            ),
          ),
        ),
        const SizedBox(width: 15),
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
                  fontSize: 20,
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
        const Spacer(),
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
                icon: const Icon(Icons.message),
                color: Theme.of(context).colorScheme.primary,
                iconSize: 26,
                constraints: const BoxConstraints(
                  minWidth: 50,
                  minHeight: 50,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Call button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
                color: Colors.green,
                iconSize: 26,
                constraints: const BoxConstraints(
                  minWidth: 50,
                  minHeight: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

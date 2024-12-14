import 'package:feastease/pages/cartpage.dart';
import 'package:flutter/material.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySilverAppBar({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.orange, // Orange shopping cart icon
          ),
        ),
      ],
      backgroundColor: Colors.black, // Black background
      foregroundColor: Colors.orange, // Orange foreground for the title
      title: const Text(
        "Sunset Dinner",
        style: TextStyle(
          color: Colors.orange, // Orange title text
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}

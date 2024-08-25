import 'package:feastease/Model/Restaurant.dart';
import 'package:feastease/components/my_button.dart';
import 'package:feastease/components/mycardTile.dart';
import 'package:feastease/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
//cart
        final userCart = restaurant.cart;
        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //CLEAR CART BUTTON
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(
                                  'Are you sure you want to clear the cart ?'),
                              actions: [
                                //cancel button
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Cancel")),

                                // yes button
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Yes")),
                              ],
                            ));
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Expanded(
            child: Column(
              children: [
                //list of cart

                Expanded(
                  child: Column(
                    children: [
                      userCart.isEmpty
                          ? Center(child: const Text("Cart is empty..."))
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: userCart.length,
                                  itemBuilder: (context, index) {
                                    final cartItem = userCart[index];

                                    return MyCartTile(cartItem: cartItem);
                                  })),
                    ],
                  ),
                ),
                MyButton(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentPage())),
                  text: "Go to CheckOut",
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

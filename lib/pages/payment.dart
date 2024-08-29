import 'package:feastease/components/my_button.dart';
import 'package:feastease/pages/deliveryProgresspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Confirm Payment",
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface)),
                Text("Expiry Date: $expiryDate",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface)),
                Text("Card Holder Name: $cardHolderName",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface)),
                Text("CVV: $cvvCode",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface)),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DeliveryProgressPage()),
                );
              },
              child: Text("Yes",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text("Checkout",
            style: TextStyle(color: theme.colorScheme.onPrimary)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Credit Card Widget
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
            ),
            const SizedBox(height: 20),
            // Credit Card Form
            CreditCardForm(
              formKey: formKey,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                  isCvvFocused = data.isCvvFocused;
                });
              },
            ),
            const Spacer(),
            // Pay Now Button
            MyButton(
              text: "Pay Now",
              onTap: userTappedPay,
            ),
          ],
        ),
      ),
    );
  }
}

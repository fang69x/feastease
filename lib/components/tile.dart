import 'package:flutter/material.dart';

class SignInTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const SignInTile({Key? key, required this.imagePath, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          imagePath,
          height: 20,
        ),
      ),
    );
  }
}

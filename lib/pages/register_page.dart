import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:feastease/components/my_button.dart';
import 'package:feastease/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registerUser() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Navigator.pop(context); // Pop the loading indicator
        Navigator.pop(context, true); // Pop the register page and return true
      } else {
        Navigator.pop(context); // Pop the loading indicator
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Passwords do not match'),
              content: Text('Please ensure the passwords match.'),
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Pop the loading indicator

      // Handle error cases
      if (e.code == 'email-already-in-use') {
        showErrorMessage('This email is already in use.');
      } else if (e.code == 'weak-password') {
        showErrorMessage('The password is too weak.');
      } else {
        showErrorMessage(e.message);
      }
    }
  }

  void showErrorMessage(String? message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message ?? 'An unknown error occurred.'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 209, 209),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 25),
                const Icon(
                  Icons.person_add,
                  color: Color.fromARGB(255, 126, 126, 126),
                  size: 100,
                ),
                const SizedBox(height: 25),
                const Text(
                  'Create a new account',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyButton(
                  text: "Register",
                  onTap: registerUser,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color.fromARGB(255, 48, 48, 48),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

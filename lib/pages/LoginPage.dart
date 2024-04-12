import 'package:feastease/components/my_button.dart';
import 'package:feastease/components/my_text_field.dart';
import 'package:feastease/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() {
    // fill out authentication here

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // logo
            children: [
              Icon(
                Icons.lock_open_rounded,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              Text(
                "Feast Ease",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

// usernames

              const SizedBox(
                height: 25,
              ),
              MyTextfield(
                  controller: emailController,
                  hintText: "Username",
                  obscureText: false),
              const SizedBox(
                height: 25,
              ),
              MyTextfield(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),
              const SizedBox(
                height: 10,
              ),
              MyButton(
                onTap: () {
                  setState(() {
                    login();
                  });
                },
                text: "Sign In",
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member ?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      " Register Now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ]

            // password

            // sign in method
            ),
      ),
    );
  }
}

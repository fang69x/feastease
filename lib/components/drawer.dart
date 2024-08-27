import 'package:feastease/components/my_drawer_tile.dart';
import 'package:feastease/pages/LoginPage.dart';
import 'package:feastease/pages/setting_page.dart';
import 'package:feastease/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Future<void> logOut(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signOut();
      // Navigate to the login page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(
                  onTap: () {},
                )), // Replace with your actual login page
        (Route<dynamic> route) => false, // Removes all routes from the stack
      );
    } catch (e) {
      // Handle errors (e.g., show an error message)
      print('Logout failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Spacer(),
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () {
              logOut(context);
            },
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

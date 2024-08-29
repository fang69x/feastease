import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 20, 20, 20),
    primary: const Color.fromARGB(255, 122, 122, 122),
    secondary: const Color.fromARGB(255, 30, 30, 30),
    tertiary: const Color.fromARGB(255, 47, 47, 47),
    inversePrimary: Colors.grey.shade300,
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 16.0, color: Colors.grey.shade300),
    bodyMedium: TextStyle(fontSize: 14.0, color: Colors.grey.shade500),
    labelLarge: const TextStyle(fontSize: 16.0, color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 15, 9, 9),
    foregroundColor: Colors.white, // Text and icon color
    elevation: 0, // Removes shadow
    centerTitle: true, // Centers the title
    titleTextStyle: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.grey.shade700),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
  ),
);

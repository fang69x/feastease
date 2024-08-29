import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFF5F5F5), // Slightly off-white for a softer background
    primary: Color(0xFF4A4A4A), // Dark grey for a more defined primary color
    secondary: Color(0xFFBDBDBD), // Light grey for secondary elements
    tertiary: Color(0xFFFFFFFF), // Pure white for tertiary elements
    inversePrimary: Color(0xFF616161), // Medium grey for inverse primary
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16.0, color: Colors.grey.shade800),
    bodyMedium: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
    labelLarge: TextStyle(fontSize: 16.0, color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF4A4A4A), // Match the primary color
    titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF4A4A4A), // Primary color for buttons
    textTheme: ButtonTextTheme.primary,
  ),
);

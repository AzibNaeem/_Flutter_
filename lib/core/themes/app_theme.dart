import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      bodyMedium: TextStyle(fontSize: 16),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}

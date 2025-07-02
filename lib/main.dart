import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyPracticeApp());
}

class MyPracticeApp extends StatelessWidget {
  const MyPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Playground',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const PracticeHome(),
    );
  }
}

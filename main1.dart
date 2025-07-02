import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded Widget Example')),
      body: Column(
        children: [
          // Fixed height container
          Container(
            height: 100,
            color: Colors.red,
            child: const Center(child: Text('Fixed Height')),
          ),

          // Takes 1 part of remaining space
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              child: const Center(child: Text('Expanded (flex: 1)')),
            ),
          ),

          // Takes 2 parts of remaining space
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
              child: const Center(child: Text('Expanded (flex: 2)')),
            ),
          ),

          // Fixed height again
          Container(
            height: 100,
            color: Colors.orange,
            child: const Center(child: Text('Fixed Height')),
          ),
        ],
      ),
    );
  }
}

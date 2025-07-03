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
      appBar: AppBar(title: const Text('Decoration Example')),
      body: Center(
        child: SizedBox(
          height: 500, // Scrollable area
          child: ListView(
            children: [
              for (int i = 0; i < 8; i++)
                InkWell(
                  onTap: () {
                    print("Box ${i + 1} tapped!");
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

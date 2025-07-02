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

  final List<String> janwar = const ["Mano Billi", "Dog", "Lion", "Tiger", "Cheetah","Hawk", "Hippopotamus", "Elephant"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Types')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('1. ListView.separated', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: janwar.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(janwar[index]),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 2,
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('2. ListView.builder', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(title: Text('Item ${index + 1}'));
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('3. Simple ListView', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView(
              children: const[
                ListTile(title: Text('THis is an example!')),
                ListTile(title: Text('THis is an example!')),
                ListTile(title: Text('THis is an example!')),
                ListTile(title: Text('THis is an example!')),
                ListTile(title: Text('THis is an example!')),
                ListTile(title: Text('THis is an example!')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

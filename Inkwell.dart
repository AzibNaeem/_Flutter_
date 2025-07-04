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
var arrName = ["Jalpari", "Pyara bacha"];
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded Widget Example')),
      body: InkWell(
        onTap:() {
          print("Hello");
        },
          onLongPress: () {
            print("You just long pressed");
          },
          onDoubleTap: () {
            print("You just double Tapped me");
          },
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Center(child: Text("CLICK ME", style: TextStyle(fontSize: 10))),
          ),
        )
        )

    );
  }
}

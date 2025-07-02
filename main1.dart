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
      appBar: AppBar(title: const Text('ListView Types')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
          child: Center(
            child:Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                border: Border.all(
                  width: 7,
                  color: Colors.black
                ),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
                  boxShadow: [
                    BoxShadow(
                  blurRadius: 11,
                      color: Colors.grey,
                      spreadRadius: 10,
              ),
                  ],
                  // This should be done If we dont manually
                //  do borderRadius: BorderRadius.only/any/circular,etc;
                //  shape: BoxShape.circle,

              )
            )
      )
      )
    );
  }
}

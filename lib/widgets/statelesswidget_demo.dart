import 'package:flutter/material.dart';

class BannerCardDemo extends StatelessWidget {
  const BannerCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Banner Card (Stateless)')),
      body: const Center(
        child: BannerCard(),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.teal, Colors.blueGrey],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.directions_bike, size: 50, color: Colors.white),
          SizedBox(height: 10),
          Text(
            'Welcome to BikeVerse!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Your Ultimate Heavy Bike App',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

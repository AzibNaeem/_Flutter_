import 'package:flutter/material.dart';
import 'custom_card_info.dart';

class CustomCardDemo extends StatelessWidget {
  const CustomCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Card Demo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CustomInfoCard(
            icon: Icons.code,
            title: 'Flutter Developer',
            subtitle: 'Working on mobile UI with widgets.',
            color: Colors.indigo,
          ),
          SizedBox(height: 16),
          CustomInfoCard(
            icon: Icons.cloud,
            title: 'Cloud Enthusiast',
            subtitle: 'Exploring Firebase & GCP.',
            color: Colors.deepOrange,
          ),
          SizedBox(height: 16),
          CustomInfoCard(
            icon: Icons.translate,
            title: 'Translation Project',
            subtitle: 'Building English-Urdu model.',
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

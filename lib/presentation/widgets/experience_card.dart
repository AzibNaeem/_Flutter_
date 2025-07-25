import 'package:flutter/material.dart';

class ExperienceData {
  final String title;
  final List<Map<String, String>> details;

  const ExperienceData({required this.title, required this.details});
}

class ExperienceCard extends StatelessWidget {
  final ExperienceData data;
  const ExperienceCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: const Color(0xFF3C312B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.85, // 85% of screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...data.details.map((detail) {
              return _ExperienceRow(
                title: detail.keys.first,
                value: detail.values.first,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _ExperienceRow extends StatelessWidget {
  final String title;
  final String value;

  const _ExperienceRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xFFF7B22C), fontSize: 12),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFFD7C3A5),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

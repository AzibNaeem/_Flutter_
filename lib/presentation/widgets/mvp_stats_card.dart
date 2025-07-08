import 'package:flutter/material.dart';

class MvpStat {
  final String title;
  final Color color;
  final int value;

  const MvpStat({
    required this.title,
    required this.color,
    required this.value,
  });
}

class MvpStatsCard extends StatelessWidget {
  final List<MvpStat> stats;
  const MvpStatsCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: const Color(0xFF3C312B), // Secondary
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView.builder(
          itemCount: stats.length,
          itemBuilder: (context, index) {
            final stat = stats[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      stat.title,
                      style: const TextStyle(
                        color: Color(0xFFF7B22C), // Primary
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    stat.value.toString(),
                    style: const TextStyle(
                      color: Color(0xFFD7C3A5), // Accent
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

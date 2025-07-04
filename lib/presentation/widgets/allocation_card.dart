import 'package:flutter/material.dart';

class AllocationCard extends StatelessWidget {
  final String month;
  final String year;
  final String allocationStatus;
  final double percentage;

  const AllocationCard({
    super.key,
    required this.month,
    required this.year,
    required this.allocationStatus,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              month,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              year,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Flexible(child: Text(allocationStatus)),
                const Spacer(),
                Text('${(percentage * 100).toInt()}%'),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[300],
              color: Colors.pink,
              minHeight: 6,
            ),
          ],
        ),
      ),
    );
  }
}

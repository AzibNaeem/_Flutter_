import 'package:flutter/material.dart';
import 'widgets/info_card.dart';

class HRISDashboardPage extends StatelessWidget {
  const HRISDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HRIS Dashboard Practice')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            InfoCard(
              icon: Icons.calendar_today,
              title: 'Leaves',
              subtitle: 'You have 5 pending leave days',
              color: Colors.teal,
            ),
            SizedBox(height: 12),
            InfoCard(
              icon: Icons.access_time,
              title: 'Attendance',
              subtitle: 'Present for 20 days this month',
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

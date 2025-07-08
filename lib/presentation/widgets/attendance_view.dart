import 'package:flutter/material.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Attendance',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Text(
            'View',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LeaveItemData {
  final String date;
  final String reason;

  const LeaveItemData({required this.date, required this.reason});
}

class LeavesCard extends StatelessWidget {
  final List<LeaveItemData> leaves;
  const LeavesCard({Key? key, required this.leaves}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF3C312B),
      child: Column(
        children: [
          const Text('Leaves', style: TextStyle(color: Color(0xFFF7B22C))),
          ...leaves.map(
            (leave) => ListTile(
              title: Text(
                leave.date,
                style: const TextStyle(color: Color(0xFFF7B22C)),
              ),
              subtitle: Text(
                leave.reason,
                style: const TextStyle(color: Color(0xFFD7C3A5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

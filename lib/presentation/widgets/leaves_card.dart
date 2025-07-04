import 'package:flutter/material.dart';

class LeaveItemData {
  final Color color;
  final String title;
  final String value;

  const LeaveItemData({
    required this.color,
    required this.title,
    required this.value,
  });
}

class LeavesCard extends StatelessWidget {
  final List<LeaveItemData> leaves;

  const LeavesCard({super.key, required this.leaves});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 300,
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 3,
          children: leaves.map((leave) {
            return _LeaveItem(
              color: leave.color,
              title: leave.title,
              value: leave.value,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _LeaveItem extends StatelessWidget {
  final Color color;
  final String title;
  final String value;

  const _LeaveItem({
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 12),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 12)),
            Text(value,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

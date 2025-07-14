// lib/presentation/widgets/submit_leave_widgets/datePickerTile.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date

class DatePickerTile extends StatelessWidget {
  final String label;
  final DateTime? date;
  final VoidCallback onTap;

  const DatePickerTile({
    super.key,
    required this.label,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String displayDate = date != null ? DateFormat('yyyy-MM-dd').format(date!) : label;

    return ListTile(
      title: Text(displayDate),
      trailing: const Icon(Icons.calendar_today),
      onTap: onTap,
    );
  }
}

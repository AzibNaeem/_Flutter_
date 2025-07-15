import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class DatePickerTile extends StatelessWidget {
  final String label;
  final DateTime? date;
  final VoidCallback onTap;
  final Color? labelColor;
  final TextStyle? labelStyle;

  const DatePickerTile({
    Key? key,
    required this.label,
    required this.date,
    required this.onTap,
    this.labelColor,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fallbackColor = labelColor ?? AppColors.primary;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      onTap: onTap,
      leading: Icon(Icons.calendar_today, color: fallbackColor),
      title: Text(
        label,
        style: labelStyle ??
            TextStyle(
              color: fallbackColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
      ),
      subtitle: Text(
        date != null
            ? "${date!.day}-${date!.month}-${date!.year}"
            : 'Select date',
        style: TextStyle(color: fallbackColor),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TimeField extends StatelessWidget {
  final String label;
  final TimeOfDay? value;
  final void Function(TimeOfDay) onChanged;

  const TimeField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final picked = await showTimePicker(
          context: context,
          initialTime: value ?? TimeOfDay.now(),
        );
        if (picked != null) onChanged(picked);
      },
      child: InputDecorator(
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        child: Text(value != null ? value!.format(context) : 'Select Time'),
      ),
    );
  }
}

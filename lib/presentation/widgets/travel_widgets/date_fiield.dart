import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  final String label;
  final DateTime? value;
  final void Function(DateTime) onChanged;

  const DateField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: value ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) onChanged(picked);
      },
      child: InputDecorator(
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        child: Text(value != null ? value!.toLocal().toString().split(' ')[0] : 'Select Date'),
      ),
    );
  }
}

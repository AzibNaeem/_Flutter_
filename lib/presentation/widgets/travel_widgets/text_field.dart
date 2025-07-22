import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? value;
  final void Function(String) onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      onChanged: onChanged,
      initialValue: value,
    );
  }
}

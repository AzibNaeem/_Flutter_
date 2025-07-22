import 'package:flutter/material.dart';

class NumberField extends StatelessWidget {
  final String label;
  final double? value;
  final void Function(String) onChanged;

  const NumberField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      //initialValue: value,
    );
  }
}

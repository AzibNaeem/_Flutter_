import 'package:flutter/cupertino.dart';

abstract class CustomFormField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final void Function(T) onChanged;

  const CustomFormField({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });
}

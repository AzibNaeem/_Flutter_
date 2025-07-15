import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Color? labelColor;
  final Color? errorColor;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.validator,
    this.onChanged,
    this.labelColor,
    this.errorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fallback = AppColors.primary;

    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      style:TextStyle(color: AppColors.primary), // Input text color
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white, // Background color
        labelText: label,
        labelStyle: TextStyle(color: labelColor ?? fallback),
        errorStyle: TextStyle(color: errorColor ?? fallback),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: labelColor ?? fallback),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: labelColor ?? fallback, width: 2),
        ),
      ),
    );
  }
}

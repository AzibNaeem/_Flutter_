import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'custom_form_field.dart';

class NumberField extends CustomFormField<double> {
  const NumberField({
    required super.label,
    required super.value,
    required super.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppColors.init(context);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.01,
        horizontal: size.width * 0.03,
      ),
      child: Material(
        elevation: 4,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.white, width: 1.5),
          ),
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.01,
            horizontal: size.width * 0.04,
          ),
          child: TextFormField(
            style: TextStyle(color: Colors.black, fontSize: size.width * 0.04),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.number,
            initialValue: value != null ? value.toString() : '',
            onChanged: (val) {
              final parsed = double.tryParse(val);
              if (parsed != null) {
                onChanged(parsed);
              }
            },
          ),
        ),
      ),
    );
  }
}

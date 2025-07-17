import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ButtonData {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final bool outlined;
  final Color? textColor;

  ButtonData({
    required this.label,
    required this.color,
    required this.onPressed,
    this.outlined = false,
    this.textColor,
  });
}

class WorkButtons extends StatelessWidget {
  final List<ButtonData> buttons;

  const WorkButtons({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: buttons.map((btn) {
          if (btn.outlined) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: OutlinedButton(
                onPressed: btn.onPressed,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.background),
                  backgroundColor: btn.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  btn.label,
                  style: TextStyle(color: btn.textColor ?? btn.color),
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: ElevatedButton(
                onPressed: btn.onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: btn.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  btn.label,
                  style: TextStyle(color: btn.textColor ?? AppColors.black),
                ),
              ),
            );
          }
        }).toList(),
      ),
    );
  }
}

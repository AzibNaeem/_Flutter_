import 'package:flutter/material.dart';

class ButtonData {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final bool outlined;

  ButtonData({
    required this.label,
    required this.color,
    required this.onPressed,
    this.outlined = false,
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
                  side: const BorderSide(color: Color(0xFFF7B22C)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  btn.label,
                  style: const TextStyle(color: Color(0xFFF7B22C)),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton(
                onPressed: btn.onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7B22C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  btn.label,
                  style: const TextStyle(color: Color(0xFF3C312B)),
                ),
              ),
            );
          }
        }).toList(),
      ),
    );
  }
}

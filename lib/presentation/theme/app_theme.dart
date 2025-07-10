// lib/presentation/theme/app_colors.dart

import 'package:flutter/material.dart';

class AppColors {
  static late Brightness _brightness;

  static void init(BuildContext context) {
    _brightness = Theme.of(context).brightness;
  }
  static Color get primary =>
      _brightness == Brightness.light ? Colors.white : Colors.black;
  static Color get primaryLight =>
      _brightness == Brightness.light ? Colors.black : Colors.white;
  static Color get background =>
      _brightness == Brightness.light ? Color(0xFF1A1A1A) : Color(0xFF87CEEB);
  static Color get lightText =>
      _brightness == Brightness.light ? Colors.white : Color(0xFF1F1F1F);
  static const Color scheduleActive = Color(0xFF4B0082);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}

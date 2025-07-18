import 'package:flutter/material.dart';

class DashboardCardData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final Color textColor;
  final String route;
  final String? badge;
  final double? fontSize;

  DashboardCardData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.route,
    this.badge,
    this.fontSize,
  });
}

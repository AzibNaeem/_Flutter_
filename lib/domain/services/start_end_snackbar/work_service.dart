import 'package:flutter/material.dart';

class WorkService {
  static void showWorkSnackBar(BuildContext context, bool started) {
    final now = TimeOfDay.now();
    final timeString = now.format(context);
    final action = started ? 'started' : 'ended';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You have $action your work at $timeString')),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

class LogoutService {
  static Future<void> logout(
    BuildContext context, {
    VoidCallback? onLoggedOut,
  }) async {
    // Show shimmer/loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Simulate a delay for shimmer effect
    await Future.delayed(const Duration(seconds: 2));

    // Dismiss shimmer/loading
    Navigator.of(context, rootNavigator: true).pop();

    // Show snackbar
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Successfully logged out')));

    // Call optional callback (e.g., navigate to login)
    if (onLoggedOut != null) {
      onLoggedOut();
    }
  }
}

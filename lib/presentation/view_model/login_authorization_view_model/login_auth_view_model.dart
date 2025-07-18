import 'package:flutter/material.dart';
import '../../data/models/login_user.dart';
import '../../domain/services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  List<LoginUser> _users = [];

  LoginUser? get loggedInUser => _loggedInUser;

  LoginUser? validateUser(String input, String password) {
    try {
      return _users.firstWhere(
            (u) =>
        (u.email == input || u.employeeId == input) &&
            u.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}

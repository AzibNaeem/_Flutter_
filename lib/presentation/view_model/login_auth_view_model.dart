import 'package:flutter/material.dart';
import '../../data/models/login_user.dart';
import '../../domain/services/auth_service.dart';
import '../../domain/services/login_validation.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  List<LoginUser> _users = [];

  Future<void> loadUsers() async {
    _users = await _authService.fetchUsers();
    notifyListeners();
  }

  LoginUser? validateUser(String input, String password) {
    return LoginValidator.validate(
      users: _users,
      input: input,
      password: password,
    );
  }
}

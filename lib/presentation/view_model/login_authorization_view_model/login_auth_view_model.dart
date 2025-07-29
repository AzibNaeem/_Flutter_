import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/login_request.dart';
import '../../../data/models/login_user.dart';
import '../../../domain/providers/user_provider.dart';
import '../../../domain/services/auth_service.dart';


class AuthViewModel with ChangeNotifier {
  final ApiService _apiService = ApiService();
  LoginUser? _loggedInUser;

  LoginUser? get loggedInUser => _loggedInUser;

  Future<String?> login(String emailOrEmployeeId, String password,BuildContext context) async {
    try {
      LoginRequest request = LoginRequest(input: emailOrEmployeeId, password: password);
      final user = await _apiService.login(request);
      if (user != null) {
        _loggedInUser = user;
        Provider.of<UserProvider>(context, listen: false).setUser(loggedInUser!);
        print("Logged in Employee ID: ${loggedInUser?.employeeId}");
         notifyListeners();
        return null; // success
      } else {
        return 'Invalid email/ID or password';
      }
    } catch (e) {
      return e.toString().replaceAll("Exception: ", "");
    }
  }
}


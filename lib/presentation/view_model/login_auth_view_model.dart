import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:hris_project/data/models/login_user.dart';
import 'package:hris_project/domain/services/login_validation.dart';

class AuthViewModel extends ChangeNotifier {
  List<LoginUser> _users = [];

  Future<void> loadUsersFromJson() async {
    final String jsonString =
    await rootBundle.loadString('lib/data/json/loginData.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    _users = jsonData.map((e) => LoginUser.fromJson(e)).toList();
  }

  LoginUser? validateUser(String input, String password) {
    return LoginValidator.validate(
      users: _users,
      input: input,
      password: password,
    );
  }
}

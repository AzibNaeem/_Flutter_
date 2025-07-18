import 'package:flutter/material.dart';
import 'package:hris_project/data/models/login_user.dart';

class UserProvider extends ChangeNotifier {
  LoginUser? _user;

  LoginUser? get user => _user;

  void setUser(LoginUser user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}

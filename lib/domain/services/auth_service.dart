import 'dart:convert';
import 'package:flutter/services.dart';
import '../../data/models/login_user.dart';

class AuthService {
  Future<List<LoginUser>> fetchUsers() async {
    final response = await rootBundle.loadString('lib/data/json/loginData.json');
    final List<dynamic> jsonData = json.decode(response);
    return jsonData.map((user) => LoginUser.fromJson(user)).toList();
  }
}

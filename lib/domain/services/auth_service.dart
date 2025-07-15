import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/login_user.dart';
import '../../core/api_constants.dart';

class AuthService {
  Future<List<LoginUser>> fetchUsers() async {
    final response = await http.get(Uri.parse(ApiConstants.usersEndpoint));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data as List).map((e) => LoginUser.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

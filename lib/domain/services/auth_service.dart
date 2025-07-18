import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/login_request.dart';
import '../../data/models/login_user.dart';
import '../../core/api_constants.dart';

class ApiService {
  Future<LoginUser?> login(LoginRequest user) async {
    final url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.loginEndpoint}');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return LoginUser.fromJson(jsonData);
    } else {
      final error = json.decode(response.body);
      throw Exception(error['detail'] ?? 'Login failed');
    }
  }


}

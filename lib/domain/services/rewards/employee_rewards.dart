import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/API/api_constants_rewards.dart';
import '../../../data/models/employee_rewards.dart';

class RewardService {
  static Future<Reward> fetchRewardByEmployeeId(String employeeId) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/rewards/$employeeId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Reward.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load reward data');
    }
  }
}

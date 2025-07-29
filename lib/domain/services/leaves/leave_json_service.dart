import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/API/api_constants_leaves.json.dart';
import '../../../data/models/leave.dart';


class LeaveService {
  Future<List<LeaveItem>> fetchLeaves(String employeeId) async {
    final url = Uri.parse('${ApiConstantsLeaves.baseUrl}/leaves/$employeeId');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => LeaveItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load leaves');
    }
  }
}

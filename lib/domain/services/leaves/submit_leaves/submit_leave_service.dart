import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../data/models/leave_request.dart';
import '../../../../core/API/api_constants.dart';

class LeaveApiService {
  Future<void> submitLeave(LeaveRequest request) async {
    final response = await http.post(
      Uri.parse(ApiConstants.leaveRequestsEndpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to submit leave');
    }
  }


}
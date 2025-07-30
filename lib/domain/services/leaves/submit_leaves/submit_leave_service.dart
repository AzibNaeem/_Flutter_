import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../data/models/leave_request.dart';

class SubmitLeavesService {
  final String baseUrl = 'https://merry-in-martin.ngrok-free.app';

  Future<bool> submitLeave(LeaveRequest request) async {
    final url = Uri.parse('$baseUrl/submit_leave');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('❌ Failed to submit leave: ${response.body}');
        return false;
      }
    } catch (e) {
      print('❌ Exception occurred: $e');
      return false;
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../data/models/travel_request.dart';

class TravelRequestService {
  final String baseUrl = "https://merry-in-martin.ngrok-free.app";

  Future<bool> submitTravelRequest(TravelRequestModel model) async {
    final url = Uri.parse('$baseUrl/travel');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        print("❌ Failed: ${response.statusCode} - ${response.body}");
        return false;
      }
    } catch (e) {
      print("❌ Error submitting travel request: $e");
      return false;
    }
  }
}

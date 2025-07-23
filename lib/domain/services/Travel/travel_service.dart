import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/API/api_constants.dart';
import '../../../data/models/travel_request.dart';

class TravelPlanService {
  Future<void> submitTravelPlan(TravelRequest travel) async {
    final url = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.travelRequestEndpoint}');
    final response = await http.post(

      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(travel.toJson()),
    );

    if (response.statusCode != 200) {
      final error = json.decode(response.body);
      throw Exception(error['detail'] ?? 'Failed to submit travel plan');
    }
  }
}
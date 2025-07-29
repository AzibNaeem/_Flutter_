import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/API/api_constants_late_sitting.dart';
import '../../../data/models/late_sitting_model.dart';

class LateSittingService {
  Future<List<LateSittingRequest>> getRequests(String empId) async {
    final resp = await http.get(Uri.parse('${APIConstantsLateSitting.baseURL}/late_sitting/$empId'));

    print("🔍 Raw response body: ${resp.body}");

    if (resp.statusCode != 200) throw Exception('Failed');

    final data = json.decode(resp.body);

    // ✅ No "entries" key, just parse the list directly
    if (data is List) {
      return data.map((j) => LateSittingRequest.fromJson(j)).toList();
    }

    throw Exception('Unexpected format for late sitting data');
  }

  Future<void> postRequest(String empId, LateSittingRequest req) async {
    final resp = await http.post(
      Uri.parse('${APIConstantsLateSitting.baseURL}/late_sitting/$empId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(req.toJson()),
    );

    if (resp.statusCode != 200) {
      print('❌ POST Error: ${resp.body}');
      throw Exception('Post failed');
    }
  }
}

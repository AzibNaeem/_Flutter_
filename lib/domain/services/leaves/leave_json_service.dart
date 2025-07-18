import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../../data/models/leave.dart';

class LeaveJsonService {
  Future<List<Leave>> loadLeaves() async {
    final String jsonString = await rootBundle.loadString(
      'lib/data/json/leaves.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Leave.fromJson(json)).toList();
  }
}

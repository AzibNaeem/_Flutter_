import 'dart:convert';
import 'package:flutter/services.dart';
import '../../data/models/attendance_day.dart';

class AttendanceService {
  Future<List<AttendanceDay>> fetchAttendanceDays() async {
    final String jsonString = await rootBundle.loadString('assets/data/attendance_data.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((item) => AttendanceDay.fromJson(item)).toList();
  }
}

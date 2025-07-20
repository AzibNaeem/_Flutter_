import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../data/models/attendance_day.dart';

class AttendanceService {

  Future<List<AttendanceDay>> fetchAttendanceDays(String employeeId) async {
    final String jsonString = await rootBundle.loadString('lib/data/json/attendance_record.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final List<dynamic> employeeData=jsonMap [employeeId]??[];
    return employeeData.map((item) => AttendanceDay.fromJson(item)).toList();
  }
}

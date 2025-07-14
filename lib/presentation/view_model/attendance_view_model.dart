import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../data/models/attendance_day.dart';

class AttendanceViewModel extends ChangeNotifier {
  List<AttendanceDay> _attendanceDays = [];
  bool _isLoading = true;

  List<AttendanceDay> get attendanceDays => _attendanceDays;
  bool get isLoading => _isLoading;

  Future<void> loadAttendance(String employeeId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final String response =
      await rootBundle.loadString('lib/data/json/attendance_record.json');
      final Map<String, dynamic> fullData = json.decode(response);

      if (fullData.containsKey(employeeId)) {
        final List<dynamic> data = fullData[employeeId];
        _attendanceDays =
            data.map((item) => AttendanceDay.fromJson(item)).toList();
      } else {
        _attendanceDays = [];
      }

    } catch (e) {
      debugPrint("Error loading attendance: $e");
      _attendanceDays = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

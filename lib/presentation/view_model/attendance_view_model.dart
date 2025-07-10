import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../data/models/attendance_day.dart';

class AttendanceViewModel extends ChangeNotifier {
  List<AttendanceDay> _attendanceDays = [];
  bool _isLoading = true;

  List<AttendanceDay> get attendanceDays => _attendanceDays;

  bool get isLoading => _isLoading;

  Future<void> loadAttendance() async {
    _isLoading = true;
    notifyListeners(); // Notify before starting

    try {
      final String response = await rootBundle.loadString(
          'lib/data/json/attendance_record.json');
      final List<dynamic> data = json.decode(response);

      _attendanceDays =
          data.map((item) => AttendanceDay.fromJson(item)).toList();
    } catch (e) {
      debugPrint("❌ Error: $e");
      _attendanceDays = [];
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify after loading
    }
  }
}

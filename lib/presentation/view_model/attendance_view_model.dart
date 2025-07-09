import 'package:flutter/material.dart';
import '../../data/models/attendance_day.dart';
import '../../domain/services/attendance_service.dart';

class AttendanceViewModel extends ChangeNotifier {
  final AttendanceService _service = AttendanceService();
  List<AttendanceDay> _days = [];

  List<AttendanceDay> get days => _days;

  Future<void> loadAttendance() async {
    _days = await _service.fetchAttendanceDays();
    notifyListeners();
  }
}

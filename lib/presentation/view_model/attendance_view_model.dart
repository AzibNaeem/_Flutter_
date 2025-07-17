import 'package:flutter/material.dart';
import '../../data/models/attendance_day.dart';
import '../../domain/services/attendance_service.dart';

class AttendanceViewModel extends ChangeNotifier {
  final AttendanceService _attendanceService = AttendanceService();

  List<AttendanceDay> _attendanceDays = [];
  bool _isLoading = true;

  List<AttendanceDay> get attendanceDays => _attendanceDays;
  bool get isLoading => _isLoading;

  Future<void> loadAttendance(String employeeId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _attendanceDays = await _attendanceService.fetchAttendanceDays(employeeId);
    } catch (e) {
      debugPrint("Error loading attendance: $e");
      _attendanceDays = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

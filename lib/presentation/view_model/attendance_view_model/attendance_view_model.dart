import 'package:flutter/material.dart';
import '../../../data/models/attendance_day.dart';
import '../../../domain/services/attendance/attendance_service.dart';

class AttendanceViewModel extends ChangeNotifier {
  final AttendanceService _attendanceService = AttendanceService();

  List<AttendanceDay> _attendanceDays = [];
  bool _isLoading = true;

  DateTime? _fromDate;
  DateTime? _toDate;

  List<AttendanceDay> get attendanceDays => _attendanceDays;
  bool get isLoading => _isLoading;
  DateTime? get fromDate => _fromDate;
  DateTime? get toDate => _toDate;

  List<AttendanceDay> get filteredAttendanceDays {
    if (_fromDate == null || _toDate == null) return _attendanceDays;
    return _attendanceDays.where((day) {
      return !day.date.isBefore(_fromDate!) && !day.date.isAfter(_toDate!);
    }).toList();
  }

  void setFromDate(DateTime? date) {
    _fromDate = date;
    notifyListeners();
  }

  void setToDate(DateTime? date) {
    _toDate = date;
    notifyListeners();
  }

  Future<void> loadAttendance(String employeeId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _attendanceDays = await _attendanceService.fetchAttendanceDays(
        employeeId,
      );
    } catch (e) {
      debugPrint("Error loading attendance: $e");
      _attendanceDays = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

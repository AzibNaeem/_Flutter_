import 'package:flutter/material.dart';
import '../../data/models/leave_request.dart';
import '../../domain/services/leave_service.dart';

class LeaveViewModel extends ChangeNotifier {
  final LeaveApiService _leaveService = LeaveApiService();
  List<LeaveRequest> _leaveRequests = [];
  List<LeaveRequest> get leaveRequests => _leaveRequests;

  /// Submit leave request to the API
  Future<void> submitLeave(LeaveRequest request) async {
    try {
      await _leaveService.submitLeave(request);
      // await loadLeaves(request.employeeId);
    } catch (e) {
      rethrow;
    }
  }
  /// Fetch leaves for the logged-in employee
  // Future<void> loadLeaves(String employeeId) async {
  //   try {
  //     _leaveRequests = await _leaveService.getLeavesByEmployee(employeeId);
  //     notifyListeners();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
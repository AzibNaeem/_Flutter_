import 'package:flutter/material.dart';
import '../../data/models/leave_request.dart';
import '../../domain/services/leave_service.dart';

class LeaveViewModel extends ChangeNotifier {
  final LeaveService _leaveService = LeaveService();

  List<LeaveRequest> _leaveRequests = [];
  List<LeaveRequest> get leaveRequests => _leaveRequests;

  Future<void> init() async {
    await _leaveService.init();
  }

  Future<void> submitLeave(LeaveRequest request) async {
    await _leaveService.submitLeave(request);
    _leaveRequests =
        _leaveService.getLeavesByEmployee(request.employeeId);
    notifyListeners();
  }

  void loadLeaves(String employeeId) {
    _leaveRequests = _leaveService.getLeavesByEmployee(employeeId);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../../../../data/models/leave.dart';
import '../../../../domain/services/leaves/leave_json_service.dart';

class LeaveViewModel extends ChangeNotifier {
  final LeaveService _service = LeaveService();
  List<LeaveItem> _leaves = [];
  List<LeaveItem> get leaves => _leaves;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadLeaves(String employeeId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _leaves = await _service.fetchLeaves(employeeId);
    } catch (e) {
      _leaves = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}

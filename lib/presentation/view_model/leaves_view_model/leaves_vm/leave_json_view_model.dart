import 'package:flutter/material.dart';
import '../../../../data/models/leave.dart';
import '../../../../domain/services/leave_json_service.dart';

class LeaveJsonViewModel extends ChangeNotifier {
  final LeaveJsonService _leaveService = LeaveJsonService();
  List<Leave> _leaves = [];
  List<Leave> get leaves => _leaves;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadLeaves() async {
    _isLoading = true;
    notifyListeners();
    _leaves = await _leaveService.loadLeaves();
    _isLoading = false;
    notifyListeners();
  }
}

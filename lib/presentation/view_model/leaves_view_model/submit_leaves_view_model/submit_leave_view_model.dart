import 'package:flutter/material.dart';
import '../../../../data/models/leave_request.dart';
import '../../../../domain/services/leaves/submit_leaves/submit_leave_service.dart';

class SubmitLeavesViewModel extends ChangeNotifier {
  final SubmitLeavesService _service = SubmitLeavesService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> submitLeave(LeaveRequest request) async {
    _isLoading = true;
    notifyListeners();

    final success = await _service.submitLeave(request);

    _isLoading = false;
    notifyListeners();

    return success;
  }
}

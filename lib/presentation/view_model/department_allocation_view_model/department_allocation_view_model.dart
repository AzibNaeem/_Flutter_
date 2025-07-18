import 'package:flutter/material.dart';
import '../../../data/models/department_allocation.dart';
import '../../../domain/services/department_allocation_service.dart';

class DepartmentAllocationViewModel extends ChangeNotifier {
  final DepartmentAllocationService _service = DepartmentAllocationService();
  List<DepartmentAllocationItem> _allocations = [];
  List<DepartmentAllocationItem> get allocations => _allocations;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadAllocations(String employeeId) async {
    _isLoading = true;
    notifyListeners();
    _allocations = await _service.getAllocationsForUser(employeeId);
    _isLoading = false;
    notifyListeners();
  }
}

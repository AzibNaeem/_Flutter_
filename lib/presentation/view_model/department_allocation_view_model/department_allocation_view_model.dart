import 'package:flutter/material.dart';
import '../../../data/models/department_allocation.dart';
import '../../../domain/services/department_allocation/department_allocation_service.dart';

class DepartmentAllocationViewModel extends ChangeNotifier {
  final DepartmentAllocationService _service = DepartmentAllocationService();

  List<DepartmentAllocationItem> _allocations = [];
  List<DepartmentAllocationItem> get allocations => _allocations;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadAllocations(String employeeId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _allocations = await _service.getAllocationsForUser(employeeId.trim());
    } catch (e) {
      _allocations = [];
      _error = 'Failed to load allocations: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  void clear() {
    _allocations = [];
    _error = null;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../../../data/models/department_model.dart';
import '../../../domain/services/department/department_service.dart';


class DepartmentAllocationViewModel extends ChangeNotifier {
  final DepartmentAllocationService _departmentAllocationService = DepartmentAllocationService();
  List<Department> _departments = [];

  List<Department> get departments => _departments;

  Future<void> loadDepartments() async {
    try {
      _departments = await _departmentAllocationService.fetchDepartments();
      notifyListeners();
    } catch (e) {
      print("Error loading departments: $e");
    }
  }
}

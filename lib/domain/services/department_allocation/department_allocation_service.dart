import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../data/models/department_allocation.dart';
import 'department_allocation_validator.dart';

class DepartmentAllocationService {
  final DepartmentAllocationValidator _validator =
      DepartmentAllocationValidator();

  Future<List<DepartmentAllocationItem>> getAllocationsForUser(
    String employeeId,
  ) async {
    final String jsonString = await rootBundle.loadString(
      'lib/data/json/department_allocations.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    final userJson = jsonList.firstWhere(
      (user) => user['employee_id'] == employeeId,
      orElse: () => null,
    );
    if (userJson == null) return [];
    final user = DepartmentAllocationUser.fromJson(userJson);
    return _validator.validAllocations(user.allocations);
  }
}

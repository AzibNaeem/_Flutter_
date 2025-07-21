import '../../../data/models/department_allocation.dart';

class DepartmentAllocationParserService {
  static DepartmentAllocationUser parseUserFromJson(Map<String, dynamic> json) {
    return DepartmentAllocationUser(
      employeeId: json['employee_id'],
      name: json['name'],
      allocations: (json['department_allocations'] as List)
          .map((e) => parseItemFromJson(e))
          .toList(),
    );
  }

  static DepartmentAllocationItem parseItemFromJson(Map<String, dynamic> json) {
    return DepartmentAllocationItem(
      department: json['department'],
      project: json['project'],
      allocation: (json['allocation'] as num).toDouble(),
    );
  }
}

class DepartmentAllocationItem {
  final String department;
  final String project;
  final double allocation;

  DepartmentAllocationItem({
    required this.department,
    required this.project,
    required this.allocation,
  });

  factory DepartmentAllocationItem.fromJson(Map<String, dynamic> json) {
    return DepartmentAllocationItem(
      department: json['department'],
      project: json['project'],
      allocation: (json['allocation'] as num).toDouble(),
    );
  }
}

class DepartmentAllocationUser {
  final String employeeId;
  final String name;
  final List<DepartmentAllocationItem> allocations;

  DepartmentAllocationUser({
    required this.employeeId,
    required this.name,
    required this.allocations,
  });

  factory DepartmentAllocationUser.fromJson(Map<String, dynamic> json) {
    return DepartmentAllocationUser(
      employeeId: json['employee_id'],
      name: json['name'],
      allocations: (json['department_allocations'] as List)
          .map((e) => DepartmentAllocationItem.fromJson(e))
          .toList(),
    );
  }
}

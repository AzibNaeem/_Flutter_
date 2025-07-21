class DepartmentAllocationItem {
  final String department;
  final String project;
  final double allocation;

  DepartmentAllocationItem({
    required this.department,
    required this.project,
    required this.allocation,
  });
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
}

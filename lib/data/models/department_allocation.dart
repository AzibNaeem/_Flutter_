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
      department: json['department'] ?? '',
      project: json['project'] ?? '',
      allocation: (json['allocation'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'department': department,
      'project': project,
      'allocation': allocation,
    };
  }
}

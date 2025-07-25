class EmployeeAllocation {
  final String employeeId;
  final String departmentId;
  final String projectId;
  final String role;
  final DateTime allocationDate;

  EmployeeAllocation({
    required this.employeeId,
    required this.departmentId,
    required this.projectId,
    required this.role,
    required this.allocationDate,
  });

  factory EmployeeAllocation.fromJson(Map<String, dynamic> json) {
    return EmployeeAllocation(
      employeeId: json['employeeId'],
      departmentId: json['departmentId'],
      projectId: json['projectId'],
      role: json['role'],
      allocationDate: DateTime.parse(json['allocationDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'departmentId': departmentId,
      'projectId': projectId,
      'role': role,
      'allocationDate': allocationDate.toIso8601String(),
    };
  }
}

class LeaveItem {
  final String employeeId;
  final String leaveType;
  final String startDate;
  final String endDate;
  final String reason;
  final String submittedAt;

  LeaveItem({
    required this.employeeId,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.submittedAt,
  });

  factory LeaveItem.fromJson(Map<String, dynamic> json) {
    return LeaveItem(
      employeeId: json['employee_id'],
      leaveType: json['leave_type'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      reason: json['reason'],
      submittedAt: json['submitted_at'],
    );
  }
}

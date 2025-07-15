class LeaveRequest {
  final String employeeId;
  final String leaveType;
  final DateTime startDate;
  final DateTime endDate;
  final String reason;
 // final String? id;

  LeaveRequest({
    required this.employeeId,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.reason,
   // this.id,
  });

  factory LeaveRequest.fromJson(Map<String, dynamic> json) {
    return LeaveRequest(
      employeeId: json['employeeId'],
      leaveType: json['leaveType'],
      startDate: DateTime.fromMillisecondsSinceEpoch(json['startDate'] * 1000),
      endDate: DateTime.fromMillisecondsSinceEpoch(json['endDate'] * 1000),
      reason: json['reason'],
     // id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'leaveType': leaveType,
      'startDate': (startDate.millisecondsSinceEpoch / 1000).round(),
      'endDate': (endDate.millisecondsSinceEpoch / 1000).round(),
      'reason': reason,
    };
  }
}

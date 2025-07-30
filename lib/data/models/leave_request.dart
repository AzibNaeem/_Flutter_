import 'package:intl/intl.dart';

class LeaveRequest {
  final String employeeId;
  final String leaveType;
  final DateTime startDate;
  final DateTime endDate;
  final String reason;

  LeaveRequest({
    required this.employeeId,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.reason,
  });

  Map<String, dynamic> toJson() {
    final formatter = DateFormat('yyyy-MM-dd');
    return {
      'employee_id': employeeId,
      'leave_type': leaveType,
      'start_date': formatter.format(startDate),
      'end_date': formatter.format(endDate),
      'reason': reason,
    };
  }
}

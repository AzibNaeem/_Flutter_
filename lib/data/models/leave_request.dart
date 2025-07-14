import 'package:hive/hive.dart';

part 'leave_request.g.dart';

@HiveType(typeId: 0)
class LeaveRequest extends HiveObject {
  @HiveField(0)
  String employeeId;

  @HiveField(1)
  String leaveType;

  @HiveField(2)
  DateTime startDate;

  @HiveField(3)
  DateTime endDate;

  @HiveField(4)
  String reason;

  LeaveRequest({
    required this.employeeId,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.reason,
  });
}

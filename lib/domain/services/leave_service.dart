import 'package:hive/hive.dart';
import '../../data/models/leave_request.dart';

class LeaveService {
  static const String _boxName = 'leaveRequests';

  Future<void> init() async {
    await Hive.openBox<LeaveRequest>(_boxName);
  }

  Future<void> submitLeave(LeaveRequest request) async {
    final box = Hive.box<LeaveRequest>(_boxName);
    await box.add(request);
  }

  List<LeaveRequest> getLeavesByEmployee(String employeeId) {
    final box = Hive.box<LeaveRequest>(_boxName);
    return box.values
        .where((leave) => leave.employeeId == employeeId)
        .toList();
  }
}

abstract class LeaveFormEvent {}

class LeaveTypeChanged extends LeaveFormEvent {
  final String leaveType;
  LeaveTypeChanged(this.leaveType);
}

class LeaveReasonChanged extends LeaveFormEvent {
  final String reason;
  LeaveReasonChanged(this.reason);
}

class LeaveFormSubmitted extends LeaveFormEvent {}

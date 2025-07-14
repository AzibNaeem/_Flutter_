enum LeaveType {
  sick,
  casual,
  annual,
  other,
}

extension LeaveTypeExtension on LeaveType {
  String get label {
    switch (this) {
      case LeaveType.sick:
        return 'Sick';
      case LeaveType.casual:
        return 'Casual';
      case LeaveType.annual:
        return 'Annual';
      case LeaveType.other:
        return 'Other';
    }
  }
}

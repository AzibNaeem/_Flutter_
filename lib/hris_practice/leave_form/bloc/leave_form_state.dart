class LeaveFormState {
  final String leaveType;
  final String reason;
  final bool isSubmitted;

  LeaveFormState({
    required this.leaveType,
    required this.reason,
    required this.isSubmitted,
  });

  factory LeaveFormState.initial() {
    return LeaveFormState(leaveType: '', reason: '', isSubmitted: false);
  }

  LeaveFormState copyWith({
    String? leaveType,
    String? reason,
    bool? isSubmitted,
  }) {
    return LeaveFormState(
      leaveType: leaveType ?? this.leaveType,
      reason: reason ?? this.reason,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}

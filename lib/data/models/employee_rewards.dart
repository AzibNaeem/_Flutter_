class Reward {
  final int employeeId;
  final Map<String, int> rewards;

  Reward({required this.employeeId, required this.rewards});

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      employeeId: json['employee_id'],
      rewards: Map<String, int>.from(json['rewards']),
    );
  }
}

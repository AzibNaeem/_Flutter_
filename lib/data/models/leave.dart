class LeaveItem {
  final String type;
  final String date;
  final String status;

  LeaveItem({
    required this.type,
    required this.date,
    required this.status,
  });

  factory LeaveItem.fromJson(Map<String, dynamic> json) {
    return LeaveItem(
      type: json['type'],
      date: json['date'],
      status: json['status'],
    );
  }
}

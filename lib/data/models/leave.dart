class Leave {
  final String type;
  final String date;
  final String status;

  Leave({required this.type, required this.date, required this.status});

  factory Leave.fromJson(Map<String, dynamic> json) {
    return Leave(
      type: json['type'],
      date: json['date'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'date': date, 'status': status};
  }
}

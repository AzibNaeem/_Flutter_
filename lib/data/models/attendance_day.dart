class AttendanceDay {
  final String dayName;
  final int dayDate;
  final String? timeIn;
  final String? timeOut;
  final String? status;
  final bool isWeekend;
  final bool isLate;

  const AttendanceDay({
    required this.dayName,
    required this.dayDate,
    this.timeIn,
    this.timeOut,
    this.status,
    this.isWeekend = false,
    this.isLate = false,
  });

  factory AttendanceDay.fromJson(Map<String, dynamic> json) {
    return AttendanceDay(
      dayName: json['dayName'],
      dayDate: json['dayDate'],
      timeIn: json['timeIn'],
      timeOut: json['timeOut'],
      status: json['status'],
      isWeekend: json['isWeekend'] ?? false,
      isLate: json['isLate'] ?? false,
    );
  }
}

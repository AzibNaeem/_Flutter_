class AttendanceDay {
  final String dayName;
  final int dayDate;
  final String? timeIn;
  final String? timeOut;
  final String status;
  final bool isWeekend;
  final bool isLate;

  AttendanceDay({
    required this.dayName,
    required this.dayDate,
    required this.timeIn,
    required this.timeOut,
    required this.status,
    required this.isWeekend,
    required this.isLate,
  });

  factory AttendanceDay.fromJson(Map<String, dynamic> json) {
    return AttendanceDay(
      dayName: json['dayName'] as String,
      dayDate: json['dayDate'] as int,
      timeIn: json['timeIn'], // nullable
      timeOut: json['timeOut'], // nullable
      status: json['status'] as String,
      isWeekend: json['isWeekend'] as bool,
      isLate: json['isLate'] as bool,
    );
  }
}

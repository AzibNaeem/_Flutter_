import 'package:flutter/material.dart';

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
}

class AttendanceCalendar extends StatelessWidget {
  final List<AttendanceDay> attendanceDays;
  const AttendanceCalendar({super.key, required this.attendanceDays});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: attendanceDays.map((day) {
          return _AttendanceDayCell(day: day);
        }).toList(),
      ),
    );
  }
}

class _AttendanceDayCell extends StatelessWidget {
  final AttendanceDay day;
  const _AttendanceDayCell({required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, // 40% of screen width
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Text(
              day.dayName,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: day.isWeekend
                  ? _buildWeekendContent()
                  : _buildWorkdayContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekendContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          day.dayDate.toString(),
          style: TextStyle(fontSize: 28, color: Colors.grey[400]),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: const Border(
              left: BorderSide(color: Color(0xFF1A237E), width: 4),
            ),
          ),
          child: const Text('Weekend'),
        ),
      ],
    );
  }

  Widget _buildWorkdayContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          day.dayDate.toString(),
          style: TextStyle(fontSize: 28, color: Colors.grey[600]),
        ),
        if (day.timeIn != null)
          Text.rich(
            TextSpan(
              text: 'Time-in: ',
              style: TextStyle(color: Colors.grey[600]),
              children: [
                TextSpan(
                  text: day.timeIn!,
                  style: TextStyle(
                    color: day.isLate ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
          ),
        if (day.timeOut != null)
          Text(
            'Time-Out: ${day.timeOut!}',
            style: TextStyle(color: Colors.grey[600]),
          ),
        if (day.status != null)
          Text(
            'Status: ${day.status!}',
            style: const TextStyle(color: Colors.green),
          ),
      ],
    );
  }
}

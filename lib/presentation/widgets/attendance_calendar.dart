import 'package:flutter/material.dart';
import 'package:hris_project/data/models/attendance_day.dart';

import '../theme/app_theme.dart';

class AttendanceCalendar extends StatelessWidget {
  final List<AttendanceDay> attendanceDays;
  const AttendanceCalendar({super.key, required this.attendanceDays});

  @override
  Widget build(BuildContext context) {
    if (attendanceDays.isEmpty) {
      return const Center(child: Text("No attendance data available."));
    }

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
      width: MediaQuery.of(context).size.width * 0.4,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150, // or any fixed height
              child: day.isWeekend
                  ? _buildWeekendContent()
                  : _buildWorkdayContent(),
            ),
          )
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
          child: Text('Weekend', style: TextStyle(color: AppColors.primary)),
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

        Text.rich(
          TextSpan(
            text: 'Time-in: ',
            style: TextStyle(color: Colors.grey[600]),
            children: [
              TextSpan(
                text: day.timeIn ?? '-',
                style: TextStyle(
                  color: day.timeIn == null
                      ? Colors.grey
                      : (day.isLate ? Colors.red : Colors.green),
                ),
              ),
            ],
          ),
        ),

        Text(
          'Time-Out: ${day.timeOut ?? '-'}',
          style: TextStyle(color: Colors.grey[600]),
        ),

        Text(
          'Status: ${day.status ?? '-'}',
          style: const TextStyle(color: Colors.green),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presentation/view_model/attendance_view_model.dart';
import '../../presentation/widgets/attendance_calendar.dart';
import '../../presentation/widgets/leaves_card.dart';
import '../../presentation/theme/app_theme.dart';
import '../widgets/shimmer/attendance_calendar_shimmer.dart';

class AttendanceLeavesScreen extends StatefulWidget {
  const AttendanceLeavesScreen({super.key});

  @override
  State<AttendanceLeavesScreen> createState() => _AttendanceLeavesScreenState();
}

class _AttendanceLeavesScreenState extends State<AttendanceLeavesScreen> {
  @override
  void initState() {
    super.initState();
    print(" initState triggered");
    Future.microtask(() {
      print(" Calling loadAttendance...");
      context.read<AttendanceViewModel>().loadAttendance();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AttendanceViewModel>();
    final attendanceData = vm.attendanceDays;

    print("🔥 isLoading: ${vm.isLoading}");
    print("📊 attendance count: ${attendanceData.length}");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leave & Attendance',
          style: TextStyle(color: AppColors.primary),
        ),
        backgroundColor: AppColors.background,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Attendance",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.lightText,
              ),
            ),
            const SizedBox(height: 8),

            // ✅ Correct conditional rendering inside children list
            if (vm.isLoading) const AttendanceCalendarShimmer()
            else if (vm.attendanceDays.isEmpty)
              const Center(child: Text("No attendance data available."))
            else
              AttendanceCalendar(attendanceDays: vm.attendanceDays),

            const SizedBox(height: 24),
            const Text(
              "Leaves",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            const LeavesCard(leaves: []),
          ],
        ),
      ),
    );
  }
}

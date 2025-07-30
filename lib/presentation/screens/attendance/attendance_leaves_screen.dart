import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/attendance_day.dart';
import '../../../data/models/leave.dart';
import '../../../domain/providers/user_provider.dart';
import '../../view_model/attendance_view_model/attendance_view_model.dart';
import '../../view_model/leaves_view_model/leaves_vm/leave_json_view_model.dart';
import '../../widgets/attendance_calendar.dart';
import '../../widgets/leaves_card.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shimmer/attendance_calendar_shimmer.dart';
import '../../../data/models/login_user.dart';
import '../../../core/themes/theme_service.dart';
import '../../widgets/submit_leave_widgets/datePicker_Tile.dart';

class AttendanceLeavesScreen extends StatefulWidget {
  final LoginUser user;
  const AttendanceLeavesScreen({super.key, required this.user});

  @override
  State<AttendanceLeavesScreen> createState() => _AttendanceLeavesScreenState();
}

class _AttendanceLeavesScreenState extends State<AttendanceLeavesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = Provider
          .of<UserProvider>(context, listen: false)
          .user;
      if (user != null) {
        context.read<AttendanceViewModel>().loadAttendance(user.employeeId);
        context.read<LeaveViewModel>().loadLeaves(user.employeeId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AppColors.init(context);
    final size = MediaQuery
        .of(context)
        .size;
    final isTablet = size.width > 600;
    final padding = isTablet ? 32.0 : 16.0;
    final titleFontSize = isTablet ? 22.0 : 18.0;

    final attendanceVM = context.watch<AttendanceViewModel>();
    final attendanceData = attendanceVM.filteredAttendanceDays;

    final leaveVM = context.watch<LeaveViewModel>();
    final leavesData = leaveVM.leaves;
    final isLeavesLoading = leaveVM.isLoading;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Leave & Attendance',
          style: ThemeService.titleMedium.copyWith(
            color: AppColors.primary,
            fontSize: isTablet ? 22 : 18,
          ),
        ),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: isTablet
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column - Attendance
            Expanded(child: _buildAttendanceSection(
                attendanceVM, attendanceData, titleFontSize)),
            const SizedBox(width: 24),
            // Right Column - Leaves
            Expanded(child: _buildLeaveSection(
                isLeavesLoading, leavesData, titleFontSize)),
          ],
        )
            : ListView(
          children: [
            _buildAttendanceSection(
                attendanceVM, attendanceData, titleFontSize),
            const SizedBox(height: 24),
            _buildLeaveSection(isLeavesLoading, leavesData, titleFontSize),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceSection(AttendanceViewModel vm, List attendanceData,
      double titleFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: _buildDateCard(
                label: 'From', date: vm.fromDate, onPick: vm.setFromDate)),
            const SizedBox(width: 8),
            Expanded(child: _buildDateCard(
                label: 'To', date: vm.toDate, onPick: vm.setToDate)),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Attendance",
          style: ThemeService.titleMedium.copyWith(
            fontSize: titleFontSize,
            color: AppColors.lightText,
          ),
        ),
        const SizedBox(height: 8),
        if (vm.isLoading)
          const AttendanceCalendarShimmer()
        else
          if (attendanceData.isEmpty)
            const Center(child: Text("No attendance data available."))
          else
            AttendanceCalendar(
                attendanceDays: attendanceData.cast<AttendanceDay>()),
      ],
    );
  }

  Widget _buildDateCard(
      {required String label, DateTime? date, required Function(DateTime) onPick}) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: DatePickerTile(
          label: label,
          date: date,
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: date ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null) onPick(picked);
          },
        ),
      ),
    );
  }

  Widget _buildLeaveSection(bool isLoading, List<LeaveItem> leavesData,
      double titleFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Leaves",
          style: ThemeService.titleMedium.copyWith(
            fontSize: titleFontSize,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        if (isLoading)
          const Center(child: CircularProgressIndicator())
        else
          if (leavesData.isEmpty)
            const Center(child: Text("No leave data available."))
          else
            LeavesCard(
              leaves: (leavesData).map<LeaveItemData>((LeaveItem leave) {
                final isSingleDay = leave.startDate == leave.endDate;
                final formattedDate = isSingleDay
                    ? leave.startDate
                    : '${leave.startDate} to ${leave.endDate}';

                return LeaveItemData(
                  date: formattedDate,
                  reason: '${leave.leaveType} (Submitted on ${leave.submittedAt
                      .split("T")
                      .first})',
                );
              }).toList(),
            ),
      ],
    );
  }
}

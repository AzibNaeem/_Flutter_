import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/attendance_view_model/attendance_view_model.dart';
import '../../widgets/attendance_calendar.dart';
import '../../widgets/leaves_card.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shimmer/attendance_calendar_shimmer.dart';
import '../../../data/models/login_user.dart';
import '../../../core/themes/theme_service.dart';
import '../../../data/models/leave.dart';
import '../../view_model/leaves_view_model/leaves_vm/leave_json_view_model.dart';

class AttendanceLeavesScreen extends StatefulWidget {
  final LoginUser user;
  const AttendanceLeavesScreen({super.key, required this.user});

  @override
  State<AttendanceLeavesScreen> createState() => _AttendanceLeavesScreenState();
}

class _AttendanceLeavesScreenState extends State<AttendanceLeavesScreen> {
  late LeaveJsonViewModel leaveViewModel;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<AttendanceViewModel>().loadAttendance(
        widget.user.employeeId,
      );
      leaveViewModel.loadLeaves();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    leaveViewModel = Provider.of<LeaveJsonViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    AppColors.init(context);

    final vm = context.watch<AttendanceViewModel>();
    final attendanceData = vm.attendanceDays;

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final padding = isTablet ? 32.0 : 16.0;
    final titleFontSize = isTablet ? 22.0 : 18.0;

    final leaveVm = leaveViewModel;
    final leavesData = leaveVm.leaves;
    final isLeavesLoading = leaveVm.isLoading;

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(padding),
            child: constraints.maxWidth > 700
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            else if (attendanceData.isEmpty)
                              const Center(
                                child: Text("No attendance data available."),
                              )
                            else
                              AttendanceCalendar(
                                attendanceDays: attendanceData,
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
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
                            if (isLeavesLoading)
                              const Center(child: CircularProgressIndicator())
                            else if (leavesData.isEmpty)
                              const Center(
                                child: Text("No leave data available."),
                              )
                            else
                              LeavesCard(
                                leaves: leavesData
                                    .map(
                                      (leave) => LeaveItemData(
                                        date: leave.date,
                                        reason:
                                            '${leave.type} (${leave.status})',
                                      ),
                                    )
                                    .toList(),
                              ),
                          ],
                        ),
                      ),
                    ],
                  )
                : ListView(
                    children: [
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
                      else if (attendanceData.isEmpty)
                        const Center(
                          child: Text("No attendance data available."),
                        )
                      else
                        AttendanceCalendar(attendanceDays: attendanceData),

                      const SizedBox(height: 24),
                      Text(
                        "Leaves",
                        style: ThemeService.titleMedium.copyWith(
                          fontSize: titleFontSize,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (isLeavesLoading)
                        const Center(child: CircularProgressIndicator())
                      else if (leavesData.isEmpty)
                        const Center(child: Text("No leave data available."))
                      else
                        LeavesCard(
                          leaves: leavesData
                              .map(
                                (leave) => LeaveItemData(
                                  date: leave.date,
                                  reason: '${leave.type} (${leave.status})',
                                ),
                              )
                              .toList(),
                        ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/user_provider.dart';
import '../../view_model/attendance_view_model/attendance_view_model.dart';
import '../../widgets/attendance_calendar.dart';
import '../../widgets/leaves_card.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shimmer/attendance_calendar_shimmer.dart';
import '../../../data/models/login_user.dart';
import '../../../core/themes/theme_service.dart';
import '../../view_model/leaves_view_model/leaves_vm/leave_json_view_model.dart';
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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = Provider.of<UserProvider>(context, listen: false).user;
      context.read<AttendanceViewModel>().loadAttendance(user!.employeeId);

      final LeaveJsonViewModel leaveViewModel;
      leaveViewModel = Provider.of<LeaveJsonViewModel>(context, listen: false);
      leaveViewModel.loadLeaves();
    });
  }

  @override
  Widget build(BuildContext context) {
    AppColors.init(context);

    final vm = context.watch<AttendanceViewModel>();
    final attendanceData = vm.filteredAttendanceDays;

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final padding = isTablet ? 32.0 : 16.0;
    final titleFontSize = isTablet ? 22.0 : 18.0;
    late LeaveJsonViewModel leaveViewModel = Provider.of<LeaveJsonViewModel>(
      context,
    );
    final leavesData = leaveViewModel.leaves;
    final isLeavesLoading = leaveViewModel.isLoading;

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
                            // Date pickers for attendance filter
                            Row(
                              children: [
                                Expanded(
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      child: DatePickerTile(
                                        label: 'From',
                                        date: vm.fromDate,
                                        onTap: () async {
                                          final picked = await showDatePicker(
                                            context: context,
                                            initialDate:
                                                vm.fromDate ?? DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                          );
                                          if (picked != null)
                                            vm.setFromDate(picked);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      child: DatePickerTile(
                                        label: 'To',
                                        date: vm.toDate,
                                        onTap: () async {
                                          final picked = await showDatePicker(
                                            context: context,
                                            initialDate:
                                                vm.toDate ?? DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                          );
                                          if (picked != null)
                                            vm.setToDate(picked);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
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
                      // Date pickers for attendance filter
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: DatePickerTile(
                                  label: 'From',
                                  date: vm.fromDate,
                                  onTap: () async {
                                    final picked = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          vm.fromDate ?? DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (picked != null) vm.setFromDate(picked);
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: DatePickerTile(
                                  label: 'To',
                                  date: vm.toDate,
                                  onTap: () async {
                                    final picked = await showDatePicker(
                                      context: context,
                                      initialDate: vm.toDate ?? DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (picked != null) vm.setToDate(picked);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
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

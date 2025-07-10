import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/attendance_day.dart';
import '../widgets/custom_end_drawer.dart';
import '../widgets/experience_card.dart';
import '../widgets/leaves_card.dart';
import '../widgets/monthly_status_card.dart';
import '../widgets/mvp_stats_card.dart';
import '../widgets/perks_card.dart';
import '../widgets/miscellaneous_info_card.dart';
import '../widgets/attendance_calendar.dart';
import 'package:intl/intl.dart';
import 'package:hris_project/presentation/widgets/user_account_info.dart';
import 'package:hris_project/presentation/widgets/work_buttons.dart';
import 'package:hris_project/presentation/widgets/date_filter.dart';
import 'package:hris_project/presentation/widgets/reporting_manager_card.dart';
import 'package:hris_project/presentation/widgets/user_profile_card.dart';

class HomeViewModel extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  List<String> get months => List.generate(12, (index) {
    return DateFormat('MMMM').format(DateTime(0, index + 1));
  });

  List<int> get years => List.generate(5, (index) {
    return DateTime.now().year - index;
  });

  void updateSelectedDate({String? month, int? year}) {
    int newMonth = month != null
        ? months.indexOf(month) + 1
        : selectedDate.month;
    int newYear = year ?? selectedDate.year;
    selectedDate = DateTime(newYear, newMonth);
    notifyListeners();
  }

  // ✅ Fixes Begin

  List<DrawerMenuItemData> get menuItems => [
    DrawerMenuItemData(icon: Icons.dashboard, title: 'Dashboard', onTap: () {}),
    DrawerMenuItemData(icon: Icons.person, title: 'Profile', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.calendar_today_outlined, title: 'Leave', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.airplanemode_active_outlined,
        title: 'Travel',
        onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.account_tree_outlined, title: 'HCD Portal', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.access_time_outlined, title: 'Late Sitting', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.analytics_outlined, title: 'Reports', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.description_outlined, title: 'CFS', onTap: () {}),
    DrawerMenuItemData(icon: Icons.school_outlined, title: 'TNA', onTap: () {}),
  ];

  ExperienceData get experienceData => ExperienceData(
    title: 'Intern at OpenAI',
    details: [
      {'Position': 'Intern'},
      {'Duration': '2023–2024'},
    ],
  );

  MonthlyStatusData get monthlyStatusData =>
      MonthlyStatusData(title: 'Monthly Status', barGroups: [], legends: []);

  List<LeaveItemData> get leavesData => [
    LeaveItemData(date: 'June 10', reason: 'Medical'),
    LeaveItemData(date: 'June 15', reason: 'Personal'),
  ];

  List<MvpStat> get mvpStatsData => [
    MvpStat(title: 'Tasks', color: Colors.blue, value: 34),
    MvpStat(title: 'Projects', color: Colors.green, value: 3),
  ];

  List<Perk> get perksData => [
    Perk(icon: Icons.fitness_center, title: 'Gym Membership'),
    Perk(icon: Icons.home, title: 'Remote Work'),
  ];

  List<MiscInfoItem> get miscellaneousInfoData => [
    MiscInfoItem(label: 'Department', value: 'Engineering'),
    MiscInfoItem(label: 'Shift', value: 'Morning'),
  ];

  List<AttendanceDay> get attendanceDaysForSelectedMonth => [
    AttendanceDay(
      dayName: 'Mon',
      dayDate: 5,
      timeIn: '09:00 AM',
      timeOut: '05:00 PM',
      status: 'Present',
      isWeekend: false,
      isLate: false,
    ),
    AttendanceDay(
      dayName: 'Tue',
      dayDate: 12,
      timeIn: null,
      timeOut: null,
      status: 'Leave',
      isWeekend: false,
      isLate: false,
    ),
  ];


// ✅ Fixes End
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          // This IconButton will open the end drawer
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      // Attach your custom end drawer here
      endDrawer: CustomEndDrawer(menuItems: viewModel.menuItems),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // User profile section in a beautiful centered card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Center the user account info
                  Center(
                    child: UserAccountInfo(
                      name: 'Pyaara Bacha',
                      role: 'Intern',
                      avatarUrl: 'https://via.placeholder.com/150',
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Center the work buttons
                  Center(
                    child: WorkButtons(
                      buttons: [
                        ButtonData(
                          label: 'Start Work',
                          color: Colors.teal,
                          onPressed: () {},
                        ),
                        ButtonData(
                          label: 'End Work',
                          color: Colors.grey,
                          onPressed: () {},
                          outlined: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _TitledCard(
            title: 'Experience',
            child: ExperienceCard(data: viewModel.experienceData),
          ),
          const SizedBox(height: 16),
          _TitledCard(
            title: 'Monthly Status',
            child: MonthlyStatusCard(data: viewModel.monthlyStatusData),
          ),
          const SizedBox(height: 16),
          _TitledCard(
            title: 'Leaves',
            child: LeavesCard(leaves: viewModel.leavesData),
          ),
          const SizedBox(height: 24),
          _TitledCard(title: 'Attendance', child: AttendanceSection()),
          const SizedBox(height: 24),
          _TitledCard(
            title: 'Reporting Manager',
            child: SizedBox(
              height: 250,
              child: ReportingManagerCard(name: 'No Reporting Manager'),
            ),
          ),
          const SizedBox(height: 16),
          _TitledCard(
            title: 'User Profile',
            child: SizedBox(height: 280, child: UserProfileCard.defaultCard()),
          ),
          const SizedBox(height: 16),
          // You can add allocationCardWidget or other widgets here as needed
          _TitledCard(
            title: 'MVP Stats',
            child: SizedBox(
              height: 300,
              child: MvpStatsCard(stats: viewModel.mvpStatsData),
            ),
          ),
          const SizedBox(height: 24),
          _TitledCard(
            title: 'Perks',
            child: SizedBox(
              height: 250,
              child: PerksCard(perks: viewModel.perksData),
            ),
          ),
          const SizedBox(height: 16),
          _TitledCard(
            title: 'Miscellaneous Info',
            child: SizedBox(
              height: 300,
              child: MiscellaneousInfoCard(
                items: viewModel.miscellaneousInfoData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TitledCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _TitledCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

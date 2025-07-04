import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hrisapp/presentation/widgets/allocation_card.dart';
import 'package:hrisapp/presentation/widgets/attendance_view.dart';
import 'package:hrisapp/presentation/widgets/custom_end_drawer.dart';
import 'package:hrisapp/presentation/widgets/experience_card.dart';
import 'package:hrisapp/presentation/widgets/leaves_card.dart';
import 'package:hrisapp/presentation/widgets/miscellaneous_info_card.dart';
import 'package:hrisapp/presentation/widgets/monthly_status_card.dart';
import 'package:hrisapp/presentation/widgets/mvp_stats_card.dart';
import 'package:hrisapp/presentation/widgets/perks_card.dart';
import 'package:hrisapp/presentation/widgets/reporting_manager_card.dart';
import 'package:hrisapp/presentation/widgets/user_account_info.dart';
import 'package:hrisapp/presentation/widgets/user_profile_card.dart';
import 'package:hrisapp/presentation/widgets/work_buttons.dart';
import 'package:hrisapp/presentation/widgets/attendance_calendar.dart';
import 'package:hrisapp/presentation/widgets/date_filter.dart';
import 'package:hrisapp/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    final allocationCardWidget = AllocationCard(
      month: 'June',
      year: '2025',
      allocationStatus: 'Unallocated',
      percentage: 1.0,
    );

    return Scaffold(
      endDrawer: CustomEndDrawer(menuItems: viewModel.menuItems),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('HRIS',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              backgroundColor: Colors.white,
              elevation: 1,
              floating: true,
              snap: true,
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.blue, size: 30),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            UserAccountInfo(
              name: 'Abdullah Umar',
              role: 'Intern',
              avatarUrl:
              'https://www.google.com/imgres?q=avatar%20url&imgurl=https%3A%2F%2Fimg.freepik.com%2Ffree-psd%2F3d-illustration-human-avatar-profile_23-2150671142.jpg&imgrefurl=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Favatar&docid=DjJcL6-DnnZi6M&tbnid=FwNZ5GOVnzizSM&vet=12ahUKEwjK5p6K9pqOAxVPXfEDHSvzIiAQM3oECE8QAA..i&w=626&h=626&hcb=2&ved=2ahUKEwjK5p6K9pqOAxVPXfEDHSvzIiAQM3oECE8QAA',
            ),
            const SizedBox(height: 16),
            WorkButtons(
              buttons: [
                ButtonData(
                    label: 'Start Work', color: Colors.teal, onPressed: () {}),
                ButtonData(
                    label: 'End Work',
                    color: Colors.grey,
                    onPressed: () {},
                    outlined: true),
              ],
            ),
            const SizedBox(height: 24),
            _TitledCard(
                title: 'Experience',
                child: ExperienceCard(data: viewModel.experienceData)),
            const SizedBox(height: 16),
            _TitledCard(
                title: 'Monthly Status',
                child: MonthlyStatusCard(data: viewModel.monthlyStatusData)),
            const SizedBox(height: 16),
            _TitledCard(
                title: 'Leaves',
                child: LeavesCard(leaves: viewModel.leavesData)),
            const SizedBox(height: 24),
            _TitledCard(
              title: 'Attendance',
              child: const AttendanceSection(),
            ),
            const SizedBox(height: 24),
            _TitledCard(
                title: 'Reporting Manager',
                child: SizedBox(
                    height: 250,
                    child: ReportingManagerCard(name: 'No Reporting Manager'))),
            const SizedBox(height: 16),
            _TitledCard(
              title: 'User Profile',
              child: SizedBox(
                  height: 280, child: UserProfileCard.defaultCard()),
            ),
            const SizedBox(height: 16),
            _TitledCard(title: 'Allocation', child: allocationCardWidget),
            const SizedBox(height: 16),
            _TitledCard(
                title: 'MVP Stats',
                child: SizedBox(
                    height: 300,
                    child: MvpStatsCard(stats: viewModel.mvpStatsData))),
            const SizedBox(height: 24),
            _TitledCard(
                title: 'Perks',
                child: SizedBox(
                    height: 250, child: PerksCard(perks: viewModel.perksData))),
            const SizedBox(height: 16),
            _TitledCard(
                title: 'Miscellaneous Info',
                child: SizedBox(
                    height: 300,
                    child: MiscellaneousInfoCard(
                        items: viewModel.miscellaneousInfoData))),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: Colors.pink, width: 7),
        BarChartRodData(toY: y2, color: Colors.blue, width: 7),
      ],
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

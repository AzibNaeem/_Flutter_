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

    final dashboardCards = [
      _DashboardCard(
        color: const Color(0xFFF2F2FF),
        icon: Icons.calendar_today_outlined,
        title: 'Leave & Attendance',
        value: '2.600',
        iconColor: Colors.black,
      ),
      _DashboardCard(
        color: Colors.black,
        icon: Icons.bar_chart,
        title: 'Employee Report',
        value: '2.600',
        iconColor: Colors.white,
        textColor: Colors.white,
      ),
      _DashboardCard(
        color: Colors.blue,
        icon: Icons.attach_money,
        title: 'Salary Management',
        value: '2.600',
        iconColor: Colors.white,
        badge: '+12%',
        badgeColor: Colors.white,
        badgeTextColor: Colors.blue,
        textColor: Colors.white,
      ),
      _DashboardCard(
        color: const Color(0xFFF6FAFF),
        icon: Icons.school,
        title: 'Onboarding & Training',
        value: '2.600',
        iconColor: Colors.black,
        badge: '+12%',
        badgeColor: Colors.white,
        badgeTextColor: Colors.blue,
      ),
    ];

    final scheduleTimes = ['08:00', '09:00', '09:35', '10:00'];
    final selectedTime = '09:35';

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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.purple[100],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Welcome back!', style: TextStyle(fontSize: 14)),
                          SizedBox(height: 2),
                          Text('Eveline Murphy',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none_rounded,
                          size: 28),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.15,
                          children: dashboardCards,
                        ),
                        const SizedBox(height: 32),
                        const Text('Today Schedule',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 16),
                        Row(
                          children: scheduleTimes.map((time) {
                            final isSelected = time == selectedTime;
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Container(
                                width: 80,
                                height: 64,
                                decoration: BoxDecoration(
                                  color:
                                      isSelected ? Colors.purple : Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                                child: Center(
                                  child: Text(
                                    time,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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

class _DashboardCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String value;
  final Color? iconColor;
  final String? badge;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final Color? textColor;

  const _DashboardCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.value,
    this.iconColor,
    this.badge,
    this.badgeColor,
    this.badgeTextColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor ?? Colors.black, size: 28),
              if (badge != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: badgeColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badge!,
                    style: TextStyle(
                      color: badgeTextColor ?? Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}

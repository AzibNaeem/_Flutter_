import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hris_project/presentation/widgets/allocation_card.dart';
import 'package:hris_project/presentation/widgets/attendance_view.dart';
import 'package:hris_project/presentation/widgets/custom_end_drawer.dart';
import 'package:hris_project/presentation/widgets/experience_card.dart';
import 'package:hris_project/presentation/widgets/leaves_card.dart';
import 'package:hris_project/presentation/widgets/miscellaneous_info_card.dart';
import 'package:hris_project/presentation/widgets/monthly_status_card.dart';
import 'package:hris_project/presentation/widgets/mvp_stats_card.dart';
import 'package:hris_project/presentation/widgets/perks_card.dart';
import 'package:hris_project/presentation/widgets/reporting_manager_card.dart';
import 'package:hris_project/presentation/widgets/user_account_info.dart';
import 'package:hris_project/presentation/widgets/user_profile_card.dart';
import 'package:hris_project/presentation/widgets/work_buttons.dart';
import 'package:hris_project/presentation/widgets/attendance_calendar.dart';
import 'package:hris_project/presentation/widgets/date_filter.dart';
import 'package:hris_project/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:hris_project/presentation/screens/splash_screen/splash_screen.dart';

import '../../../data/models/login_user.dart';
import '../../widgets/drawer_menu_item.dart';
import '../../widgets/drawer_menu_list.dart';
import '../../../core/themes/theme_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginUser user;
    final viewModel = Provider.of<HomeViewModel>(context);

    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final padding = isTablet ? 32.0 : 16.0;
    final titleFontSize = isTablet ? 22.0 : 18.0;

    final allocationCardWidget = AllocationCard(
      month: 'June',
      year: '2025',
      allocationStatus: 'Unallocated',
      percentage: 1.0,
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.all(padding),
            child: constraints.maxWidth > 700
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
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
                                    Center(
                                      child: UserAccountInfo(
                                        name: 'Abdullah Umar',
                                        role: 'Intern',
                                        avatarUrl: 'https://i.pravatar.cc/300',
                                      ),
                                    ),
                                    const SizedBox(height: 20),
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
                              child: ExperienceCard(
                                data: viewModel.experienceData,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _TitledCard(
                              title: 'Monthly Status',
                              child: MonthlyStatusCard(
                                data: viewModel.monthlyStatusData,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _TitledCard(
                              title: 'Leaves',
                              child: LeavesCard(leaves: viewModel.leavesData),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: ListView(
                          children: [
                            _TitledCard(
                              title: 'Attendance',
                              child: const AttendanceSection(),
                            ),
                            const SizedBox(height: 24),
                            _TitledCard(
                              title: 'Reporting Manager',
                              child: SizedBox(
                                height: 250,
                                child: ReportingManagerCard(
                                  name: 'No Reporting Manager',
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _TitledCard(
                              title: 'User Profile',
                              child: SizedBox(
                                height: 280,
                                child: UserProfileCard.defaultCard(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _TitledCard(
                              title: 'Allocation',
                              child: allocationCardWidget,
                            ),
                            const SizedBox(height: 16),
                            _TitledCard(
                              title: 'MVP Stats',
                              child: SizedBox(
                                height: 300,
                                child: MvpStatsCard(
                                  stats: viewModel.mvpStatsData,
                                ),
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
                      ),
                    ],
                  )
                : ListView(
                    padding: EdgeInsets.all(padding),
                    children: [
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
                              Center(
                                child: UserAccountInfo(
                                  name: 'Abdullah Umar',
                                  role: 'Intern',
                                  avatarUrl: 'https://i.pravatar.cc/300',
                                ),
                              ),
                              const SizedBox(height: 20),
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
                        child: MonthlyStatusCard(
                          data: viewModel.monthlyStatusData,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _TitledCard(
                        title: 'Leaves',
                        child: LeavesCard(leaves: viewModel.leavesData),
                      ),
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
                          child: ReportingManagerCard(
                            name: 'No Reporting Manager',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _TitledCard(
                        title: 'User Profile',
                        child: SizedBox(
                          height: 280,
                          child: UserProfileCard.defaultCard(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _TitledCard(
                        title: 'Allocation',
                        child: allocationCardWidget,
                      ),
                      const SizedBox(height: 16),
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
        },
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
        Text(title, style: ThemeService.titleMedium),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

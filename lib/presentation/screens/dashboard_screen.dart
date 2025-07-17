import 'package:flutter/material.dart';
import 'package:hris_project/data/models/login_user.dart';
import 'package:hris_project/presentation/widgets/user_account_info.dart';
import 'package:hris_project/presentation/widgets/work_buttons.dart';
import 'package:hris_project/presentation/view_model/attendance_view_model.dart';
import 'package:hris_project/presentation/widgets/custom_end_drawer.dart';
import 'package:provider/provider.dart';
import 'package:hris_project/presentation/view_model/home_view_model.dart';
import 'package:hris_project/presentation/theme/app_theme.dart';
import '../../core/themes/theme_service.dart';

import '../widgets/drawer_menu_item.dart';
import '../widgets/drawer_menu_list.dart';

class DashboardScreen extends StatefulWidget {
  final LoginUser user;
  const DashboardScreen({super.key, required this.user});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isWorking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AttendanceViewModel>(
        context,
        listen: false,
      ).loadAttendance(widget.user.employeeId);
    });
  }

  void _toggleWork(bool start) {
    setState(() {
      _isWorking = start;
    });
    final now = TimeOfDay.now();
    final timeString = now.format(context);
    final action = start ? 'started' : 'ended';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You have $action your work at $timeString')),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppColors.init(context);
    final viewModel = Provider.of<HomeViewModel>(context);
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final padding = isTablet ? 32.0 : 16.0;
    final titleFontSize = isTablet ? 28.0 : 22.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      endDrawer: CustomEndDrawer(
        menuContent: DrawerMenuList(context: context, user: widget.user),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isTablet ? 60 : 48),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'HRIS',
            style: ThemeService.appBar.copyWith(
              color: AppColors.black,
              fontSize: titleFontSize,
            ),
          ),
          backgroundColor: AppColors.white,
          elevation: 0.5,
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: AppColors.primary,
                  size: isTablet ? 36 : 30,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
            SizedBox(width: isTablet ? 16 : 8, height: isTablet ? 60 : 50),
          ],
          iconTheme: IconThemeData(color: AppColors.primary),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: constraints.maxWidth > 700
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: isTablet ? 32 : 16),
                              Card(
                                elevation: 4,
                                color: AppColors.primaryLight,
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
                                          name: widget.user.name,
                                          role: widget.user.role,
                                        ),
                                      ),
                                      SizedBox(height: isTablet ? 32 : 20),
                                      Center(
                                        child: WorkButtons(
                                          buttons: [
                                            ButtonData(
                                              label: 'Start Work',
                                              color: _isWorking
                                                  ? AppColors.white
                                                  : AppColors.background,
                                              textColor: AppColors.primary,
                                              onPressed: _isWorking
                                                  ? () {}
                                                  : () => _toggleWork(true),
                                            ),
                                            ButtonData(
                                              label: 'End Work',
                                              color: _isWorking
                                                  ? AppColors.background
                                                  : AppColors.white,
                                              textColor: AppColors.primary,
                                              onPressed: !_isWorking
                                                  ? () {} // no-op when disabled
                                                  : () => _toggleWork(false),
                                              outlined: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: isTablet ? 32 : 24),
                              _buildGridCards(context, isTablet: true),
                            ],
                          ),
                        ),
                        SizedBox(width: isTablet ? 32 : 24),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: isTablet ? 32 : 24),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Today Schedule",
                                  style: ThemeService.titleMedium.copyWith(
                                    fontSize: isTablet ? 22 : 16,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                              SizedBox(height: isTablet ? 24 : 12),
                              _buildScheduleTimeline(isTablet: true),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(height: 16),
                        Card(
                          elevation: 4,
                          color: AppColors.primaryLight,
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
                                    name: widget.user.name,
                                    role: widget.user.role,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: WorkButtons(
                                    buttons: [
                                      ButtonData(
                                        label: 'Start Work',
                                        color: _isWorking
                                            ? AppColors.white
                                            : AppColors.background,
                                        textColor: AppColors.primary,
                                        onPressed: _isWorking
                                            ? () {} // no-op when disabled
                                            : () => _toggleWork(true),
                                      ),
                                      ButtonData(
                                        label: 'End Work',
                                        color: _isWorking
                                            ? AppColors.background
                                            : AppColors.white,
                                        textColor: AppColors.primary,
                                        onPressed: !_isWorking
                                            ? () {} // no-op when disabled
                                            : () => _toggleWork(false),
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
                        _buildGridCards(context),
                        const SizedBox(height: 24),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Today's Meeting Schedule",
                            style: ThemeService.titleMedium.copyWith(
                              fontSize: 16,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildScheduleTimeline(),
                      ],
                    ),
            ),
          );
        },
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.white),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.black,
          iconSize: 28,
          currentIndex: 0,
          onTap: (index) {},
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 40),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, size: 33),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message, size: 35),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 36),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleTimeline({bool isTablet = false}) {
    return SizedBox(
      height: isTablet ? 100 : 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 16),
        children: const [
          _ScheduleBlock(time: '8:00 AM', active: true),
          _ScheduleBlock(time: '9:00 AM'),
          _ScheduleBlock(time: '9:35 AM'),
          _ScheduleBlock(time: '3:00 PM', active: true),
        ],
      ),
    );
  }

  Widget _buildGridCards(BuildContext context, {bool isTablet = false}) {
    final cards = [
      _DashboardCardData(
        title: 'Leave & Attendance',
        value: '',
        icon: Icons.calendar_today,
        color: AppColors.primaryLight,
        route: '/attendance-leaves',
        textColor: AppColors.lightText,
      ),
      _DashboardCardData(
        title: 'Employee Report',
        value: '',
        icon: Icons.bar_chart,
        color: AppColors.primaryLight,
        route: '/report',
        textColor: AppColors.lightText,
      ),
      _DashboardCardData(
        title: 'Salary Management',
        value: '',
        icon: Icons.attach_money,
        color: AppColors.primaryLight,
        route: '/payslip',
        textColor: AppColors.lightText,
      ),
      _DashboardCardData(
        title: 'Onboarding & Training',
        value: '',
        icon: Icons.school,
        color: AppColors.primaryLight,
        route: '/onboarding',
        textColor: AppColors.lightText,
      ),
    ];

    // Always 2 columns, square cards
    final crossAxisCount = 2;
    final aspectRatio = 1.0;
    final cardIconSize = isTablet ? 40.0 : 32.0;
    final cardTitleFontSize = isTablet ? 16.0 : 14.0;
    final cardValueFontSize = isTablet ? 20.0 : 16.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 0 : 0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cards.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: isTablet ? 24 : 12,
          mainAxisSpacing: isTablet ? 24 : 12,
          childAspectRatio: aspectRatio,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              cards[index].route,
              arguments: widget.user,
            );
          },
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: cards[index].color,
            child: Padding(
              padding: EdgeInsets.all(isTablet ? 20 : 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    cards[index].icon,
                    size: cardIconSize,
                    color: cards[index].textColor,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    cards[index].title,
                    textAlign: TextAlign.center,
                    style: ThemeService.cardTitle.copyWith(
                      fontSize: cardTitleFontSize,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cards[index].value,
                    style: ThemeService.cardValue.copyWith(
                      fontSize: cardValueFontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScheduleBlock extends StatelessWidget {
  final String time;
  final bool active;

  const _ScheduleBlock({required this.time, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: active ? AppColors.scheduleActive : AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      alignment: Alignment.center,
      child: Text(
        time,
        style: ThemeService.bodyMedium.copyWith(
          color: active ? AppColors.white : AppColors.lightText,
          fontWeight: ThemeService.fontWeightBold,
        ),
      ),
    );
  }
}

class _DashboardCardData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final Color textColor;
  final String route;
  final String? badge;

  _DashboardCardData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.route,
    this.badge,
  });
}

class _FuturisticCard extends StatelessWidget {
  final _DashboardCardData card;

  const _FuturisticCard({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(card.icon, size: 26, color: card.textColor),
              const SizedBox(height: 16),
              Text(card.title, style: ThemeService.cardTitle),
              const SizedBox(height: 6),
              Text(card.value, style: ThemeService.cardValue),
            ],
          ),
          if (card.badge != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  card.badge!,
                  style: ThemeService.bodySmall.copyWith(
                    fontWeight: ThemeService.fontWeightBold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

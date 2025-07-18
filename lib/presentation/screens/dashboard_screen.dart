import 'package:flutter/material.dart';
import 'package:hris_project/data/models/login_user.dart';
import 'package:hris_project/domain/providers/user_provider.dart';
import 'package:hris_project/presentation/widgets/user_account_info.dart';
import 'package:hris_project/presentation/widgets/work_buttons.dart';
import 'package:hris_project/presentation/view_model/attendance_view_model.dart';
import 'package:hris_project/presentation/widgets/custom_end_drawer.dart';
import 'package:provider/provider.dart';
import 'package:hris_project/presentation/view_model/home_view_model.dart';
import 'package:hris_project/presentation/theme/app_theme.dart';
import '../../domain/providers/user_provider.dart';
import '../widgets/drawer_menu_item.dart';
import '../widgets/drawer_menu_list.dart';

class DashboardScreen extends StatefulWidget {
  //final LoginUser user;
  DashboardScreen({super.key});


  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    //  Provider.of<AttendanceViewModel>(context, listen: false).loadAttendance(widget.user.employeeId);
    });
  }


  @override
  Widget build(BuildContext context) {
    final user1=Provider.of<UserProvider>(context).user;
    AppColors.init(context);
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      endDrawer: CustomEndDrawer(
        menuContent: DrawerMenuList(context: context, user: user1!,),

      ),



      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Container(
              child: const Text(
                'HRIS',
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            backgroundColor: AppColors.white,
            elevation: 0.5,
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon:  Icon(
                    Icons.menu,
                    color: AppColors.primary,
                    size: 30,
                  ),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
              const SizedBox(width: 8, height: 50),
            ],
            iconTheme:  IconThemeData(color: AppColors.primary),
          ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child: Card(
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
                          name: user1!.name,
                          role: user1.role,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: WorkButtons(
                          buttons: [
                            ButtonData(
                              label: 'Start Work',
                              color: AppColors.primary,
                              onPressed: () {},
                            ),
                            ButtonData(
                              label: 'End Work',
                              color: AppColors.primary,
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
            ),
            const SizedBox(height: 24),
            _buildGridCards(context),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today Schedule",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildScheduleTimeline(),
          ],
        ),
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

  Widget _buildScheduleTimeline() {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          _ScheduleBlock(time: '08:00'),
          _ScheduleBlock(time: '09:00'),
          _ScheduleBlock(time: '09:35'),
          _ScheduleBlock(time: '10:00', active: true),
        ],
      ),
    );
  }

  Widget _buildGridCards(BuildContext context) {
    final cards = [
      _DashboardCardData(
        title: 'Leave & Attendance',
        value: '2.600',
        icon: Icons.calendar_today,
        color: AppColors.primaryLight,
        route: '/attendance-leaves',
        textColor: AppColors.lightText
      ),
      _DashboardCardData(
        title: 'Employee Report',
        value: '2.600',
        icon: Icons.bar_chart,
        color: AppColors.primaryLight,
        route: '/report',
          textColor: AppColors.lightText
      ),
      _DashboardCardData(
        title: 'Salary Management',
        value: '2.600',
        icon: Icons.attach_money,
        color: AppColors.primaryLight,
        route: '/payslip',
          textColor: AppColors.lightText
      ),
      _DashboardCardData(
        title: 'Onboarding & Training',
        value: '2.600',
        icon: Icons.school,
        color: AppColors.primaryLight,
        route: '/onboarding',
          textColor: AppColors.lightText
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cards.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
        //    Navigator.pushNamed(context, cards[index].route,arguments: widget.user);
          },
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: cards[index].color,
            child: _FuturisticCard(card: cards[index]),
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
        style: TextStyle(
          color: active ? AppColors.white : AppColors.lightText,
          fontWeight: FontWeight.bold,
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
              Text(
                card.title,
                style: const TextStyle(fontSize: 13, color: Colors.black),
              ),
              const SizedBox(height: 6),
              Text(
                card.value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
              ),
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
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}



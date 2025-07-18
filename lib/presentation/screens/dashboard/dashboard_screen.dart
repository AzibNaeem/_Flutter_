import 'package:flutter/material.dart';
import 'package:hris_project/data/models/login_user.dart';
import 'package:hris_project/presentation/view_model/attendance_view_model/attendance_view_model.dart';
import 'package:hris_project/presentation/widgets/custom_end_drawer.dart';
import 'package:provider/provider.dart';
import 'package:hris_project/presentation/theme/app_theme.dart';
import '../../../core/themes/theme_service.dart';
import '../../../domain/services/futuristic_card/futuristic_card_service.dart';
import '../../widgets/dashboard_grid.dart';
import '../../widgets/drawer_menu_list.dart';
import '../../../domain/services/dashboard_cards/dashboard_card_data_service.dart';
import '../../../domain/services/schedule_service/schedule_block_service.dart';
import '../../widgets/profile_card.dart';
import '../../widgets/department_allocation.dart';
import '../../../domain/services/start_end_snackbar/work_service.dart';
import '../../widgets/dashboard_allocation.dart';
import '../../view_model/department_allocation_view_model/department_allocation_view_model.dart';

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
      Provider.of<DepartmentAllocationViewModel>(
        context,
        listen: false,
      ).loadAllocations(widget.user.employeeId);
    });
  }

  void _toggleWork(bool start) {
    setState(() {
      _isWorking = start;
    });
    WorkService.showWorkSnackBar(context, start);
  }

  @override
  Widget build(BuildContext context) {
    AppColors.init(context);
    // final viewModel = Provider.of<HomeViewModel>(context);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            children: [
              ProfileCard(
                user: widget.user,
                isWorking: _isWorking,
                onStartWork: () => _toggleWork(true),
                onEndWork: () => _toggleWork(false),
              ),
              SizedBox(height: 24),
              DashboardGrid(user: widget.user),
              SizedBox(height: 24),
              Consumer<DepartmentAllocationViewModel>(
                builder: (context, allocVm, _) {
                  if (allocVm.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return DashboardAllocation(allocations: allocVm.allocations);
                },
              ),
            ],
          ),
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
          ScheduleBlock(time: '8:00 AM', active: true),
          ScheduleBlock(time: '9:00 AM'),
          ScheduleBlock(time: '9:35 AM'),
          ScheduleBlock(time: '3:00 PM', active: true),
        ],
      ),
    );
  }

  Widget _buildGridCards(BuildContext context, {bool isTablet = false}) {
    final cards = [
      DashboardCardData(
        title: 'Leave & Attendance',
        value: '',
        icon: Icons.calendar_today,
        color: AppColors.primaryLight,
        route: '/attendance-leaves',
        textColor: AppColors.lightText,
      ),
      DashboardCardData(
        title: 'Employee Report',
        value: '',
        icon: Icons.bar_chart,
        color: AppColors.primaryLight,
        route: '/report',
        textColor: AppColors.lightText,
      ),
      DashboardCardData(
        title: 'Salary Management',
        value: '',
        icon: Icons.attach_money,
        color: AppColors.primaryLight,
        route: '/payslip',
        textColor: AppColors.lightText,
      ),
      DashboardCardData(
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
    // final cardIconSize = isTablet ? 40.0 : 32.0;
    // final cardTitleFontSize = isTablet ? 16.0 : 14.0;
    // final cardValueFontSize = isTablet ? 20.0 : 16.0;

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
              child: FuturisticCard(card: cards[index]),
            ),
          ),
        ),
      ),
    );
  }
}

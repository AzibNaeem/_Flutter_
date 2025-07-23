import 'package:flutter/material.dart';
import 'package:hris_project/data/models/login_user.dart';
import 'package:hris_project/presentation/view_model/attendance_view_model/attendance_view_model.dart';
import 'package:hris_project/presentation/widgets/custom_end_drawer.dart';
import 'package:provider/provider.dart';
import 'package:hris_project/presentation/theme/app_theme.dart';
import '../../../core/themes/theme_service.dart';
import '../../../domain/providers/user_provider.dart';
import '../../widgets/dashboard_grid.dart';
import '../../widgets/drawer_menu_list.dart';
import '../../widgets/profile_card.dart';
import '../../../domain/services/start_end_snackbar/work_service.dart';
import '../../widgets/dashboard_allocation.dart';
import '../../view_model/department_allocation_view_model/department_allocation_view_model.dart';
import '../../widgets/shimmer/department_allocations_shimmer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isWorking = false;

  LoginUser? user1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (user1 == null) {
      user1 = Provider.of<UserProvider>(context).user;

      // Call functions after widget is built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (user1 != null) {
          Provider.of<AttendanceViewModel>(
            context,
            listen: false,
          ).loadAttendance(user1!.employeeId);

          Provider.of<DepartmentAllocationViewModel>(
            context,
            listen: false,
          ).loadAllocations(user1!.employeeId);
        }
      });
    }
  }

  void _toggleWork(bool start) {
    setState(() {
      _isWorking = start;
    });
    WorkService.showWorkSnackBar(context, start);
  }

  @override
  Widget build(BuildContext context) {
    final user1 = Provider.of<UserProvider>(context).user;
    AppColors.init(context);
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final padding = isTablet ? 32.0 : 16.0;
    final titleFontSize = isTablet ? 28.0 : 22.0;
    return Scaffold(
      backgroundColor: AppColors.background,
      endDrawer: CustomEndDrawer(
        menuContent: DrawerMenuList(context: context, user: user1!),
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
                user: user1,
                isWorking: _isWorking,
                onStartWork: () => _toggleWork(true),
                onEndWork: () => _toggleWork(false),
              ),
              SizedBox(height: 24),
              DashboardGrid(user: user1),
              SizedBox(height: 24),
              Consumer<DepartmentAllocationViewModel>(
                builder: (context, allocVm, _) {
                  if (allocVm.isLoading) {
                    return const DepartmentAllocationShimmer();
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

}

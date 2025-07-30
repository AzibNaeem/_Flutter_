import 'package:flutter/material.dart';
import 'package:hris_project/presentation/widgets/drawer_menu_item.dart';
import 'package:hris_project/data/models/login_user.dart';

import '../routes.dart';

class DrawerMenuList extends StatelessWidget {
  final BuildContext context;
  final LoginUser user;

  const DrawerMenuList({super.key, required this.context, required this.user});

  @override
  Widget build(BuildContext ctx) {
    final List<DrawerMenuItemData> items = [
      DrawerMenuItemData(
        icon: Icons.dashboard,
        title: 'Dashboard',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/dashboard', arguments: user);
        },
      ),
      DrawerMenuItemData(
        icon: Icons.calendar_today,
        title: 'Attendance and Leaves',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/attendance-leaves', arguments: user);
        },
      ),
      DrawerMenuItemData(
        icon: Icons.assignment,
        title: 'Submit Leave',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/submitLeave', arguments: user);
        },
      ),
      DrawerMenuItemData(
        icon: Icons.airport_shuttle,
        title: 'Travel',
        onTap: () {
          Navigator.pop(context);
             Navigator.pushNamed(context, '/travel-plan-submit');
        },
      ),
      DrawerMenuItemData(
        icon: Icons.analytics,
        title: 'HCD Portal',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/hcd');
        },
      ),
      DrawerMenuItemData(
        icon: Icons.access_time,
        title: 'Late Sitting',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/late_sitting');
        },
      ),

      DrawerMenuItemData(
        icon: Icons.bar_chart,
        title: 'Reports',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/reports', arguments: user);
        },
      ),
      DrawerMenuItemData(
        icon: Icons.show_chart,
        title: 'CFS',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/feedback');
        },
      ),
      DrawerMenuItemData(
        icon: Icons.assignment_turned_in,
        title: 'TNA',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/tna', arguments: user);
        },
      ),
    ];

    // ✅ Convert to widgets
    return Column(
      children: items.map((item) => DrawerMenuItem(item: item)).toList(),
    );
  }
}

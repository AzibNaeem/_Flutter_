import 'package:flutter/material.dart';
import 'package:hris_project/presentation/widgets/drawer_menu_item.dart';
import 'package:hris_project/data/models/login_user.dart';

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
        },
      ),
      DrawerMenuItemData(
        icon: Icons.person,
        title: 'Profile',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/profile', arguments: user);
        },
      ),
      DrawerMenuItemData(
        icon: Icons.calendar_today_outlined,
        title: 'Leave',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/submitLeave', arguments: user);
        },
      ),

    ];

    // ✅ Convert to widgets
    return Column(
      children: items.map((item) => DrawerMenuItem(item: item)).toList(),

    );
  }
}

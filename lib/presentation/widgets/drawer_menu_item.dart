import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class DrawerMenuItemData {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerMenuItemData({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

class DrawerMenuItem extends StatelessWidget {
  final DrawerMenuItemData item;
  const DrawerMenuItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        color: AppColors.background,
        child: ListTile(
          leading: Icon(item.icon, color: AppColors.primary),
          title: Text(item.title, style: TextStyle(color: AppColors.primary)),
          onTap: item.onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
    return ListTile(
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: item.onTap,
    );
  }
}

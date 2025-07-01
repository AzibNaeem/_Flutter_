import 'package:flutter/material.dart';
import 'custom_end_drawer.dart';

class DrawerMenuItem extends StatelessWidget {
  final DrawerMenuItemData item;
  const DrawerMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(item.icon, color: Colors.white),
      title: Text(
        item.title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: const Icon(Icons.expand_more, color: Colors.white),
      onTap: item.onTap,
    );
  }
}

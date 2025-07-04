import 'package:flutter/material.dart';
import 'drawer_menu_item.dart';

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

class CustomEndDrawer extends StatelessWidget {
  final List<DrawerMenuItemData> menuItems;
  const CustomEndDrawer({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF3F51B5), // A blue color similar to the image
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 16.0),
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...menuItems.map((item) => DrawerMenuItem(item: item)).toList(),
          ],
        ),
      ),
    );
  }
}

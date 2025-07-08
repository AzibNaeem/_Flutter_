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

class DrawerMenuItem extends StatelessWidget {
  final DrawerMenuItemData item;
  const DrawerMenuItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(item.icon, color: Color(0xFFF7B22C)),
      title: Text(item.title, style: const TextStyle(color: Color(0xFFF7B22C))),
      onTap: item.onTap,
    );
  }
}

class CustomEndDrawer extends StatelessWidget {
  final List<DrawerMenuItemData> menuItems;
  const CustomEndDrawer({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF3C312B),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 16.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFFF7B22C),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...menuItems.map((item) => DrawerMenuItem(item: item)),
          ],
        ),
      ),
    );
  }
}

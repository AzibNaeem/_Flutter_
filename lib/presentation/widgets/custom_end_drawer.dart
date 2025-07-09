import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
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
      leading: Icon(item.icon, color: Theme.of(context).primaryColor),
      title: Text(item.title, style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color)),
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
        color: AppColors.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, right: 260.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.primary,
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

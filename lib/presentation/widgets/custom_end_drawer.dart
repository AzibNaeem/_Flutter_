import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomEndDrawer extends StatelessWidget {
  final Widget menuContent;

  const CustomEndDrawer({super.key, required this.menuContent});

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
            menuContent,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hris_project/data/models/menu_item.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/theme_service.dart';
import '../../theme/app_theme.dart';
import '../../view_model/hcd_view_model/hcd_view_model.dart';
import '../../widgets/hcd/menu_download_button.dart';
import '../../widgets/hcd/menu_dropdown.dart';
import '../../widgets/hcd/menu_listview.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String _selectedDayId = "Monday";

  @override
  void initState() {
    super.initState();
    final vm = Provider.of<MenuViewModel>(context, listen: false);
    vm.loadMenuByDay(_selectedDayId);
    vm.loadWeeklyMenu();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MenuViewModel>(context);
    final menu = vm.selectedDayMenu;
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final padding = isTablet ? 32.0 : 16.0;
    final labelFontSize = isTablet ? 20.0 : 20.0;
    final buttonFontSize = isTablet ? 20.0 : 16.0;
    return Scaffold(
      backgroundColor: AppColors.white,

        appBar: AppBar(
          backgroundColor: AppColors.background,
          iconTheme: IconThemeData(color: AppColors.primary),
          title: Text(
            'Weekly Menu',
            style: ThemeService.appBar.copyWith(
              color: AppColors.primary,
              fontSize: isTablet ? 24 : 20,
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuDayDropdown(
              days: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
              selectedDay: _selectedDayId,
              onChanged: (newDayId) {
                setState(() {
                  _selectedDayId = newDayId!;
                });
                vm.loadMenuByDay(newDayId!);
              },
            ),
            const SizedBox(height: 20),
            if (vm.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (menu != null)
              MenuListView(menu: menu)
            else
              const Text("No menu available."),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

// lib/presentation/widgets/menu/default_menu_widget_builder.dart
import 'package:flutter/material.dart';

import '../../../data/models/menu_item.dart';
import 'menu_download_button.dart';
import 'menu_dropdown.dart';
import 'menu_listview.dart';
import 'menu_widget_builder.dart';

class DefaultMenuWidgetBuilder implements MenuWidgetBuilder {
  @override
  Widget buildDayDropdown({
    required List<String> days,
    required String? selectedDay,
    required void Function(String?) onChanged,
  }) {
    return MenuDayDropdown(
      days: days,
      selectedDay: selectedDay,
      onChanged: onChanged,
    );
  }

  @override
  Widget buildMenuList(MenuModel? menu) {
    return MenuListView(menu: menu);
  }

  @override
  Widget buildDownloadButton(List<MenuModel> weeklyMenu) {
    return MenuDownloadButton(weeklyMenu: weeklyMenu);
  }
}

// lib/presentation/widgets/menu/menu_widget_builder.dart
import 'package:flutter/material.dart';
import '../../../data/models/menu_item.dart';


abstract class MenuWidgetBuilder {
  Widget buildDayDropdown({
    required List<String> days,
    required String? selectedDay,
    required void Function(String?) onChanged,
  });

  Widget buildMenuList(MenuModel? menu);
  Widget buildDownloadButton(List<MenuModel> weeklyMenu);
}

// lib/presentation/widgets/menu/menu_download_button.dart
import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import '../../../data/models/menu_item.dart';


class MenuDownloadButton extends StatelessWidget {
  final List<MenuModel> weeklyMenu;

  const MenuDownloadButton({
    super.key,
    required this.weeklyMenu,
  });

  void downloadJson() {
    final data = weeklyMenu.map((menu) => menu.toJson()).toList();
    final jsonStr = jsonEncode(data);

    final bytes = utf8.encode(jsonStr);
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "weekly_menu.json")
      ..click();

    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: downloadJson,
      icon: const Icon(Icons.download),
      label: const Text("Download Menu"),
    );
  }
}

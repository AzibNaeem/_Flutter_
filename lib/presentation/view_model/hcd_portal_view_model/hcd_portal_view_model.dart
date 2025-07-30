import 'package:flutter/material.dart';
import '../../../data/models/hcd_portal/hcd_model.dart' show WeeklyMenu;
import '../../../domain/services/hcd_portal/hcd_service.dart';

class HCDViewModel extends ChangeNotifier {
  List<WeeklyMenu> menu = [];
  bool isLoading = false;

  Future<void> loadWeeklyMenu() async {
    isLoading = true;
    notifyListeners();

    menu = await HCDService.getWeeklyMenu();

    isLoading = false;
    notifyListeners();
  }
}

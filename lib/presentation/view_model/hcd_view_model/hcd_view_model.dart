import 'package:flutter/material.dart';

import '../../../data/models/menu_item.dart';
import '../../../domain/repositories/hcd/hcd_repository.dart';

class MenuViewModel extends ChangeNotifier {
  final MenuRepository menuRepository;

  MenuViewModel(this.menuRepository);

  List<MenuModel> _weeklyMenu = [];
  MenuModel? _selectedDayMenu;
  bool _isLoading = false;
  String? _error;

  List<MenuModel> get weeklyMenu => _weeklyMenu;
  MenuModel? get selectedDayMenu => _selectedDayMenu;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadWeeklyMenu() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _weeklyMenu = await menuRepository.getWeeklyMenu();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMenuByDay(String day) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _selectedDayMenu = await menuRepository.getMenuByDay(day);
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}

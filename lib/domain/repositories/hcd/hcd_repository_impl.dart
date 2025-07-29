
import '../../../data/models/menu_item.dart';
import '../../services/HCD/hcd_service.dart';
import 'hcd_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuService menuService;

  MenuRepositoryImpl(this.menuService);

  @override
  Future<List<MenuModel>> getWeeklyMenu() {
    return menuService.fetchWeeklyMenu();
  }

  @override
  Future<MenuModel?> getMenuByDay(String day) {
    return menuService.fetchMenuByDay(day);
  }
}

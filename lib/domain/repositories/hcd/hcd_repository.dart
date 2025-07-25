
import '../../../data/models/menu_item.dart';

abstract class MenuRepository {
  Future<List<MenuModel>> getWeeklyMenu();
  Future<MenuModel?> getMenuByDay(String day);
}

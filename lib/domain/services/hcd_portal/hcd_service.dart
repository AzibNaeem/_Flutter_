import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../data/models/hcd_portal/hcd_model.dart';

class HCDService {
  static Future<List<WeeklyMenu>> getWeeklyMenu() async {
    const baseUrl = 'https://merry-in-martin.ngrok-free.app/menu';
    final weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    List<WeeklyMenu> menuList = [];

    for (String day in weekdays) {
      final url = Uri.parse('$baseUrl/${day.toLowerCase()}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        if (decoded is Map<String, dynamic>) {
          menuList.add(WeeklyMenu.fromJson(decoded));
        }
      } else {
        // Skip if day not found or server error
        continue;
      }
    }

    return menuList;
  }
}

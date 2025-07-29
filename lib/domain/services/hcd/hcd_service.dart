import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/models/menu_item.dart';



class MenuService {
  final String baseUrl = "https://merry-in-martin.ngrok-free.app";

  Future<List<MenuModel>> fetchWeeklyMenu() async {
    final response = await http.get(Uri.parse("$baseUrl/menu"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => MenuModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load menu");
    }
  }
  Future<MenuModel?> fetchMenuByDay(String day) async {
    await Future.delayed(Duration(milliseconds: 500)); // simulate delay

    final Map<String, Map<String, dynamic>> mockData = {
      "Monday": {
        "option1": "Rice",
        "option2": "Chicken",
        "option3": "Salad",
        "dinner": "Daal",
        "dayId": 1,
      },
      "Tuesday": {
        "option1": "Pasta",
        "option2": "Beef",
        "option3": "Juice",
        "dinner": "Curry",
        "dayId": 2,
      },
      // add more days if needed
    };

    if (mockData.containsKey(day)) {
      final data = mockData[day]!;
      return MenuModel(
        day: day,
        option1: data["option1"],
        option2: data["option2"],
        option3: data["option3"],
        dinner: data["dinner"],
        dayId: data["dayId"],
      );
    } else {
      return null;
    }
  }


// Future<MenuModel?> fetchMenuByDay(String day) async {
  //   print("Requested day: '$day'");
  //   final response = await http.get(Uri.parse("$baseUrl/menu/$day"));
  //
  //   print("Status: ${response.statusCode}");
  //   print("Body: ${response.body}");
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> jsonData = json.decode(response.body);
  //     return MenuModel.fromJson(jsonData);
  //   } else {
  //     return null;
  //   }
  //}
}

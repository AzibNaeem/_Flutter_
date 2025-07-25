import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../data/models/department_model.dart';


class DepartmentAllocationService {
  static const String baseUrl = 'http://localhost:8000'; // your FastAPI host

  Future<List<Department>> fetchDepartments() async {
    final response = await http.get(Uri.parse('$baseUrl/departments/'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Department.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load departments');
    }
  }
}

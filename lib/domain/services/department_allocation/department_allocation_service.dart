import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/API/api_constants_department.dart';
import '../../../data/models/department_allocation.dart';

class DepartmentAllocationService {
  Future<List<DepartmentAllocationItem>> getAllocationsForUser(String employeeId) async {
    final url = Uri.parse('${ApiConstantsDepartment.baseUrl}/departments/$employeeId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (jsonData['department_allocations'] != null) {
        return (jsonData['department_allocations'] as List)
            .map((e) => DepartmentAllocationItem.fromJson(e))
            .toList();
      } else {
        throw Exception("No department allocations found");
      }
    } else {
      throw Exception("Failed to load department allocations");
    }
  }
}

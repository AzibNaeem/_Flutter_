import 'package:flutter/material.dart';
import '../../data/models/employee.dart';
import '../../data/mock/employee_mock.dart';

class EmployeeProvider with ChangeNotifier {
  List<Employee> _employees = mockEmployees;

  List<Employee> get employees => [..._employees];

  List<Employee> search(String query) {
    return _employees
        .where((e) =>
    e.name.toLowerCase().contains(query.toLowerCase()) ||
        e.id.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Employee getById(String id) {
    return _employees.firstWhere((e) => e.id == id);
  }
}

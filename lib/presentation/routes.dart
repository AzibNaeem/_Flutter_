import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/employee_directory_screen.dart';
import 'screens/employee_report_screen.dart';
import 'screens/home_screen.dart'; // ✅ Make sure this import exists

class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String employeeDirectory = '/employees';
  static const String report = '/report';
  static const String home = '/home'; // ✅ Added missing route constant

  static final Map<String, WidgetBuilder> routes = {
    AppRoutes.login: (context) => const LoginScreen(),
    AppRoutes.dashboard: (context) => const DashboardScreen(),
    AppRoutes.employeeDirectory: (context) => const EmployeeDirectoryScreen(),
    AppRoutes.report: (context) => const EmployeeReportScreen(),
    AppRoutes.home: (context) => const HomeScreen(), // ✅ Moved inside map
  };
}

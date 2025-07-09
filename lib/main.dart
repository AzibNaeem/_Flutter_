import 'package:flutter/material.dart';
import 'package:hris_project/presentation/view_model/attendance_view_model.dart';
import 'package:hris_project/presentation/view_model/login_auth_view_model.dart';
import 'package:provider/provider.dart';
import 'presentation/routes.dart';
import 'core/themes/app_theme.dart';
import 'domain/providers/employee_provider.dart';
import 'presentation/view_model/home_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmployeeProvider()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => AttendanceViewModel()),
      ],
      child: const HRMSApp(),
    ),
  );
}

class HRMSApp extends StatelessWidget {
  const HRMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HR Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

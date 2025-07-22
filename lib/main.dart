import 'package:flutter/material.dart';
import 'package:hris_project/presentation/view_model/attendance_view_model/attendance_view_model.dart';
import 'package:hris_project/presentation/view_model/login_authorization_view_model/login_auth_view_model.dart';
import 'package:provider/provider.dart';
import 'domain/providers/user_provider.dart';
import 'presentation/routes.dart';
import 'domain/providers/employee_provider.dart';
import 'presentation/view_model/home_view_model.dart';
import 'presentation/view_model/leaves_view_model/leaves_vm/leave_json_view_model.dart';
import 'presentation/view_model/department_allocation_view_model/department_allocation_view_model.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => LeaveJsonViewModel()),
        ChangeNotifierProvider(create: (context) => AttendanceViewModel()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => DepartmentAllocationViewModel()),

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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

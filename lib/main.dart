import 'package:flutter/material.dart';
import 'package:hris_project/presentation/view_model/attendance_view_model.dart';
import 'package:hris_project/presentation/view_model/leave_view_model.dart';
import 'package:hris_project/presentation/view_model/login_auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'presentation/routes.dart';
import 'core/themes/app_theme.dart';
import 'domain/providers/employee_provider.dart';
import 'presentation/view_model/home_view_model.dart';
import 'data/models/leave_request.dart';

void main() async {
 // WidgetsFlutterBinding.ensureInitialized();
 // await Hive.initFlutter();
 //
 // Hive.registerAdapter(LeaveRequestAdapter());
 //
 // await Hive.openBox<LeaveRequest>('leaveRequests');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmployeeProvider()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => AttendanceViewModel()),
        ChangeNotifierProvider(create: (_) => LeaveViewModel()),
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

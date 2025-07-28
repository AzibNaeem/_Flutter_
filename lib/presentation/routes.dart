import 'package:flutter/material.dart';
import 'package:hris_project/presentation/screens/Travel/travel_plan.dart';
import 'package:hris_project/presentation/screens/experience/employee_experience.dart';
import 'package:hris_project/presentation/screens/late_sitting_screen/late_sitting_screen.dart';
import 'package:hris_project/presentation/screens/rewards/rewards_screen.dart';
import 'package:hris_project/presentation/screens/team/team_screen.dart';
import 'package:hris_project/presentation/view_model/all_teams_view_model/all_teams_vm.dart';
import 'package:hris_project/presentation/view_model/rewards_view_model/rewards_view_model.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/employee/employee_directory_screen.dart';
import 'screens/employee/employee_report_screen.dart';
import 'package:hris_project/data/models/login_user.dart';
import 'package:hris_project/presentation/screens/attendance/attendance_leaves_screen.dart'; // New import
import 'screens/submit_leaves/submit_leave_screen.dart';
class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String employeeDirectory = '/employees';
  static const String report = '/report';
  static const String home = '/home';
  static const String attendanceLeaves = '/attendance-leaves';
  static const String submitLeaves='/submitLeave';
  static const String travelPlan='/travel-plan-submit';
  static const String experience = '/experience';
  static const String myTeams = '/my-teams';
  static const String rewards = '/rewards';
  static const String late_sitting = '/late-sitting';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case dashboard:
      // final user = settings.arguments;
      // if (user is! LoginUser) {
      //   return _errorRoute('Missing or invalid user for dashboard.');
      // }
        return MaterialPageRoute(
          builder: (_) => DashboardScreen(),
        );

      case travelPlan:
        return MaterialPageRoute(
            builder: (_) => const TravelFormScreen());
      case employeeDirectory:
        return MaterialPageRoute(
            builder: (_) => const EmployeeDirectoryScreen());

      case report:
        return MaterialPageRoute(
            builder: (_) => const EmployeeReportScreen());

    // case home:
    //   return MaterialPageRoute(builder: (_) => const HomeScreen());

      case submitLeaves:
      //final args=settings.arguments as LoginRequest;
        return MaterialPageRoute(
            builder: (_) => SubmitLeaveScreen());

      case attendanceLeaves:
        final args = settings.arguments as LoginUser;
        return MaterialPageRoute(
            builder: (_) => AttendanceLeavesScreen(user: args));

      case experience:
        return MaterialPageRoute(
            builder: (_) => ExperienceScreen());

    case AppRoutes.myTeams:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
          create: (_) => AllTeamsViewModel(),
          child: const MyTeamsScreen()),
    );
    case rewards:
    return MaterialPageRoute(
    builder: (_) => ChangeNotifierProvider(
    create: (_) => RewardViewModel(),
    child: const RewardsScreen(),
    ),
    );
      case '/late_sitting':
        return MaterialPageRoute(builder: (_) => const LateSittingScreen());



      default:
        return _errorRoute('Route not found: ${settings.name}');
    }
  }



  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text(message)),
      ),
    );
  }
}

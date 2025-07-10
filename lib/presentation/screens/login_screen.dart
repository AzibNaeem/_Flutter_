import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hris_project/presentation/view_model/login_auth_view_model.dart';
import 'package:hris_project/presentation/screens/dashboard_screen.dart';
import 'package:hris_project/data/models/login_user.dart';
import '../view_model/login_auth_view_model.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailOrIdController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AuthViewModel>(context, listen: false).loadUsersFromJson();
    });
  }

  void validateLogin() {
    final input = emailOrIdController.text.trim();
    final password = passwordController.text;

    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final matchingUser = authViewModel.validateUser(input, password);

    if (matchingUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DashboardScreen(user: matchingUser),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email, ID or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AppColors.init(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.5,
        title: Text(
          "Login",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme:  IconThemeData(color: AppColors.primary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: "Email or Employee ID",
              hint: "example@gmail.com or 1234",
              controller: emailOrIdController,
              icon: Icons.email,
              fillColor: Colors.white,
              textColor: Colors.black,
              labelColor: Colors.grey[800],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Password",
              hint: "********",
              controller: passwordController,
              icon: Icons.lock,
              isPassword: true,
              fillColor: AppColors.primary,
              textColor: Colors.white,
              labelColor: Colors.white,
            ),
            const SizedBox(height: 32),
            CustomButton(
              label: "Login",
              onPressed: validateLogin,
            ),
          ],
        ),
      ),
    );
  }
}

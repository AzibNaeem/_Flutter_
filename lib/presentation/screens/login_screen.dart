import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/models/login_user.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../routes.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailOrIdController = TextEditingController();
  final passwordController = TextEditingController();
  List<LoginUser> users = [];

  @override
  void initState() {
    super.initState();
    loadLoginData();
  }

  Future<void> loadLoginData() async {
    final String jsonString =
    await rootBundle.loadString('lib/data/json/loginData.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      users = jsonData.map((e) => LoginUser.fromJson(e)).toList();
    });
  }

  void validateLogin() {
    final input = emailOrIdController.text.trim();
    final password = passwordController.text;

    final matchingUser = users.firstWhere(
          (user) =>
      (user.email == input || user.employeeId == input) &&
          user.password == password,
      orElse: () => LoginUser(email: '', password: '', employeeId: ''),
    );

    if (matchingUser.email.isNotEmpty) {
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email, ID or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.5,
        title: const Text(
          "Login",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.primary),
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

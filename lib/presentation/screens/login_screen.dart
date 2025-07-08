import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: "Email or Employee ID",
              controller: emailController,
              icon: Icons.email,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Password",
              controller: passwordController,
              icon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 32),
            CustomButton(
              label: "Login",
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
              },
            ),
          ],
        ),
      ),
    );
  }
}

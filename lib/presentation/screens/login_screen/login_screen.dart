import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hris_project/presentation/view_model/login_authorization_view_model/login_auth_view_model.dart';
import '../../routes.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import '../../theme/app_theme.dart';
import '../../../core/themes/theme_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailOrIdController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  void validateLogin() async {
    final email = emailOrIdController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email/ID and password')),
      );
      return;
    }

    setState(() => _isLoading = true);

    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final result = await authViewModel.login(email, password,context);

    setState(() => _isLoading = false);

    if (result == null) {
      // Login successful

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.dashboard,
     //   arguments: authViewModel.loggedInUser,
      );
    } else {
      // Login failed - show specific message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
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
          style: ThemeService.appBar.copyWith(
            color: AppColors.primary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
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
                  CustomButton(label: "Login", onPressed: validateLogin),
                ],
              ),
            ),
    );
  }

}

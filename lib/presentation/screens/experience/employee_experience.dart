import 'package:flutter/material.dart';

class EmployeeExperienceScreen extends StatelessWidget {
  const EmployeeExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Experience')),
      body: const Center(
        child: Text('Employee Experience Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

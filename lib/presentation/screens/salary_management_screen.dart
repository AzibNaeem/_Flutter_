import 'package:flutter/material.dart';

class SalaryManagementScreen extends StatelessWidget {
  const SalaryManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Salary Management')),
      body: const Center(
        child: Text('Salary Management Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

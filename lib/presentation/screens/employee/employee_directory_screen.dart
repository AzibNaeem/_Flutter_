import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/employee_provider.dart';
import '../../widgets/employee_tile.dart';

class EmployeeDirectoryScreen extends StatefulWidget {
  const EmployeeDirectoryScreen({super.key});

  @override
  State<EmployeeDirectoryScreen> createState() =>
      _EmployeeDirectoryScreenState();
}

class _EmployeeDirectoryScreenState extends State<EmployeeDirectoryScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmployeeProvider>(context);
    final results = _query.isEmpty
        ? provider.employees
        : provider.search(_query);

    return Scaffold(
      appBar: AppBar(title: const Text('Employee Directory')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by name or ID',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) => setState(() => _query = val),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) =>
                  EmployeeTile(employee: results[index]),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../data/models/employee.dart';

class EmployeeTile extends StatelessWidget {
  final Employee employee;

  const EmployeeTile({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(employee.imageUrl),
        ),
        title: Text(employee.name),
        subtitle: Text(employee.position),
        trailing: IconButton(
          icon: const Icon(Icons.phone),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Call ${employee.phone}')),
            );
          },
        ),
      ),
    );
  }
}

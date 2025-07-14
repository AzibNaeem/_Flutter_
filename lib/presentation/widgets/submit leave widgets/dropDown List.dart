import 'package:flutter/material.dart';
import '../../../data/models/leave_type.dart';

class CustomLeaveTypeDropdown extends StatelessWidget {
  final LeaveType value;
  final Function(LeaveType?) onChanged;

  const CustomLeaveTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<LeaveType>(
      value: value,
      decoration: const InputDecoration(labelText: 'Leave Type'),
      items: LeaveType.values
          .map((type) => DropdownMenuItem(
        value: type,
        child: Text(type.label),
      ))
          .toList(),
      onChanged: onChanged,
    );
  }
}

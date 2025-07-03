import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/leave_form_bloc.dart';
import '../bloc/leave_form_event.dart';
import '../bloc/leave_form_state.dart';

class LeaveFormPage extends StatelessWidget {
  const LeaveFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LeaveFormBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Apply for Leave')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: LeaveForm(),
        ),
      ),
    );
  }
}

class LeaveForm extends StatelessWidget {
  const LeaveForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LeaveFormBloc>();

    return BlocBuilder<LeaveFormBloc, LeaveFormState>(
      builder: (context, state) {
        return Column(
          children: [
            DropdownButtonFormField<String>(
              value: state.leaveType.isEmpty ? null : state.leaveType,
              hint: const Text("Select Leave Type"),
              items: ['Sick Leave', 'Casual Leave', 'Annual Leave']
                  .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  bloc.add(LeaveTypeChanged(value));
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Reason'),
              onChanged: (value) {
                bloc.add(LeaveReasonChanged(value));
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                bloc.add(LeaveFormSubmitted());
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Leave Submitted!"),
                ));
              },
              child: const Text("Submit Leave"),
            ),
            const SizedBox(height: 24),
            if (state.isSubmitted)
              const Text("Leave request submitted!", style: TextStyle(color: Colors.green))
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/leave_request.dart';
import '../../data/models/leave_type.dart';
import '../../data/models/login_user.dart';
import '../view_model/leave_view_model.dart';
import '../widgets/submit leave widgets/datePickerTile.dart';
import '../widgets/submit leave widgets/dropDown List.dart';
import '../widgets/submit leave widgets/textFormField.dart';

class SubmitLeaveScreen extends StatefulWidget {
  final LoginUser user;
  const SubmitLeaveScreen({super.key, required this.user});

  @override
  State<SubmitLeaveScreen> createState() => _SubmitLeaveScreenState();
}

class _SubmitLeaveScreenState extends State<SubmitLeaveScreen> {
  final _formKey = GlobalKey<FormState>();
  LeaveType _leaveType = LeaveType.sick;
  DateTime? _startDate;
  DateTime? _endDate;
  String _reason = '';

  Future<void> _pickDate(BuildContext context, bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate() &&
        _startDate != null &&
        _endDate != null) {
      final request = LeaveRequest(
        employeeId: widget.user.employeeId,
        leaveType: _leaveType.label,
        startDate: _startDate!,
        endDate: _endDate!,
        reason: _reason,
      );

      Provider.of<LeaveViewModel>(context, listen: false).submitLeave(request);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Leave submitted successfully')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Leave')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomLeaveTypeDropdown(
                value: _leaveType,
                onChanged: (val) => setState(() => _leaveType = val!),
              ),

              DatePickerTile(
                label: 'Start Date',
                date: _startDate,
                onTap: () => _pickDate(context, true),
              ),
              DatePickerTile(
                label: 'End Date',
                date: _endDate,
                onTap: () => _pickDate(context, false),
              ),

              CustomTextFormField(
                label: 'Reason',
                validator: (val) => val!.isEmpty ? 'Please provide a reason' : null,
                onChanged: (val) => _reason = val,
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit Leave'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

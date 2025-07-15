import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/leave_request.dart';
import '../../data/models/leave_type.dart';
import '../../data/models/login_user.dart';
import '../theme/app_theme.dart';
import '../view_model/leave_view_model.dart';
import '../widgets/submit_leave_widgets/datePicker_Tile.dart';
import '../widgets/submit_leave_widgets/dropDown_List.dart';
import '../widgets/submit_leave_widgets/textForm_Field.dart';

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
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              onSurface: AppColors.primary,
            ),
          ),
          child: child!,
        );
      },
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


  void _submit() async {
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

      // Show loading while submitting
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      try {
        await Provider.of<LeaveViewModel>(context, listen: false)
            .submitLeave(request);

        // Close loading spinner
        Navigator.of(context).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Leave submitted successfully')),
        );
        Navigator.pop(context); // Go back to previous screen
      } catch (e) {
        Navigator.of(context).pop(); // Close loading spinner
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.primary),
        title: Text(
          'Submit Leave',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLeaveTypeDropdown(
                  value: _leaveType,
                  onChanged: (val) => setState(() => _leaveType = val!),
                  textColor: AppColors.primary,
                  labelColor: AppColors.primary,
                ),
                const SizedBox(height: 10),

                DatePickerTile(
                  label: 'Start Date',
                  date: _startDate,
                  onTap: () => _pickDate(context, true),
                  labelColor: AppColors.primary,
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                DatePickerTile(
                  label: 'End Date',
                  date: _endDate,
                  onTap: () => _pickDate(context, false),
                  labelColor: AppColors.primary,
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                CustomTextFormField(
                  label: 'Reason',
                  labelColor: AppColors.primary,
                  validator: (val) => val!.isEmpty ? 'Please provide a reason' : null,
                  errorColor: AppColors.primary,
                  onChanged: (val) => _reason = val,
                ),
                const SizedBox(height: 20),

                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.primary,
                    ),
                    onPressed: _submit,
                    child: Text(
                      'Submit Leave',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/leave_request.dart';
import '../../../data/models/leave_type.dart';
import '../../../domain/providers/user_provider.dart';
import '../../theme/app_theme.dart';
import '../../view_model/leaves_view_model/submit_leaves_view_model/submit_leave_view_model.dart';
import '../../widgets/submit_leave_widgets/datePicker_Tile.dart';
import '../../widgets/submit_leave_widgets/dropDown_List.dart';
import '../../widgets/submit_leave_widgets/textForm_Field.dart';
import '../../../core/themes/theme_service.dart';

class SubmitLeaveScreen extends StatefulWidget {
  //final LoginUser user;
  const SubmitLeaveScreen({super.key});

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
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final employeeId = userProvider.user?.employeeId ?? '';

      if (employeeId.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: Employee ID not found')),
        );
        return;
      }

      final request = LeaveRequest(
        employeeId: employeeId,
        leaveType: _leaveType.label,
        startDate: _startDate!,
        endDate: _endDate!,
        reason: _reason,
      );

      // Show loading spinner
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      try {
        await Provider.of<SubmitLeavesViewModel>(
          context,
          listen: false,
        ).submitLeave(request);

        Navigator.of(context).pop(); // Close loading
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Leave submitted successfully')),
        );

        Navigator.pop(context); // Go back
      } catch (e) {
        Navigator.of(context).pop(); // Close loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final padding = isTablet ? 32.0 : 16.0;
    final labelFontSize = isTablet ? 20.0 : 20.0;
    final buttonFontSize = isTablet ? 20.0 : 16.0;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        iconTheme: IconThemeData(color: AppColors.primary),
        title: Text(
          'Submit Leave',
          style: ThemeService.appBar.copyWith(
            color: AppColors.primary,
            fontSize: isTablet ? 24 : 20,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(padding),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isTablet ? 500 : double.infinity,
                  ),
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
                          labelStyle: ThemeService.label.copyWith(
                            fontSize: labelFontSize,
                            color: AppColors.primary,
                          ),
                        ),
                        DatePickerTile(
                          label: 'End Date',
                          date: _endDate,
                          onTap: () => _pickDate(context, false),
                          labelColor: AppColors.primary,
                          labelStyle: ThemeService.label.copyWith(
                            fontSize: labelFontSize,
                            color: AppColors.primary,
                          ),
                        ),
                        CustomTextFormField(
                          label: 'Reason',
                          labelColor: AppColors.primary,
                          validator: (val) =>
                              val!.isEmpty ? 'Please provide a reason' : null,
                          errorColor: AppColors.primary,
                          onChanged: (val) => _reason = val,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              foregroundColor: AppColors.primary,
                              padding: EdgeInsets.symmetric(
                                horizontal: isTablet ? 40 : 24,
                                vertical: isTablet ? 18 : 12,
                              ),
                            ),
                            onPressed: _submit,
                            child: Text(
                              'Submit Leave',
                              style: ThemeService.button.copyWith(
                                color: AppColors.primary,
                                fontSize: buttonFontSize,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

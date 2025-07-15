import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../data/models/leave_type.dart';
import '../../theme/app_theme.dart';

class CustomLeaveTypeDropdown extends StatelessWidget {
  final LeaveType value;
  final ValueChanged<LeaveType?> onChanged;
  final Color? labelColor;
  final Color? textColor;
  final double? width; // Optional width control

  const CustomLeaveTypeDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
    this.labelColor,
    this.textColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fallbackColor = AppColors.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            'Leave Type',
            style: TextStyle(
              color: labelColor ?? fallbackColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Container(
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: labelColor ?? fallbackColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<LeaveType>(
              isExpanded: true,
              value: value,
              onChanged: onChanged,
              items: LeaveType.values.map((type) {
                return DropdownMenuItem<LeaveType>(
                  value: type,
                  child: Text(
                    type.label,
                    style: TextStyle(
                      color: textColor ?? fallbackColor,
                      fontSize: 16,
                    ),
                  ),
                );
              }).toList(),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: width, // Match dropdown width to container
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                offset: const Offset(0, 8), // Show dropdown below
              ),
              iconStyleData: IconStyleData(
                icon: Icon(Icons.arrow_drop_down, color: fallbackColor),
              ),
              style: TextStyle(
                color: textColor ?? fallbackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hris_project/presentation/widgets/travel_widgets/project_categories.dart';

import '../../theme/app_theme.dart';

class ProjectDropdownField extends StatelessWidget {
  final ProjectCategories value;
  final ValueChanged<ProjectCategories?> onChanged;
  final Color? labelColor;
  final Color? textColor;
  final double? width;

  const ProjectDropdownField({
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
    final dropdownWidth = width ?? MediaQuery.of(context).size.width * 0.97;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0, left: 4.0),
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
          width: dropdownWidth,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: labelColor ?? fallbackColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<ProjectCategories>(
              isExpanded: true,
              value: value,
              onChanged: onChanged,
              items: ProjectCategories.values.map((type) {
                return DropdownMenuItem<ProjectCategories>(
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
                width: dropdownWidth, // Ensures popup matches field
                maxHeight: 150,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                offset: const Offset(0, 8), // push dropdown below
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

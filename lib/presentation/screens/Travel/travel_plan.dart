import 'package:flutter/material.dart';
import 'package:hris_project/data/models/travel_type.dart' hide TravelType;
import '../../../core/themes/theme_service.dart';
import '../../../domain/enums/project_categories.dart';
import '../../../domain/enums/travel_type.dart';
import '../../theme/app_theme.dart';
import '../../widgets/dropdown/drop_down.dart';
import '../../widgets/dropdown/project_category_dropdown.dart';
import '../../widgets/dropdown/travel_type_dropdown.dart';
import '../../widgets/submit_leave_widgets/dropDown_List.dart';
import '../../widgets/travel_widgets/date_fiield.dart';
import '../../widgets/travel_widgets/drop_down_field.dart';
import '../../widgets/travel_widgets/number_field.dart';
import '../../widgets/travel_widgets/project_categories.dart';
import '../../widgets/travel_widgets/project_dropdown_fiield.dart';
import '../../widgets/travel_widgets/submit_button.dart';
import '../../widgets/travel_widgets/text_field.dart';
import '../../widgets/travel_widgets/time_field.dart';


class TravelFormScreen extends StatefulWidget {
  const TravelFormScreen({super.key});

  @override
  State<TravelFormScreen> createState() => _TravelFormScreenState();
}

class _TravelFormScreenState extends State<TravelFormScreen> {

  final _formKey = GlobalKey<FormState>();
  //TravelType _tarvelType=TravelType.domestic;
  DateTime? fromDate;
  DateTime? toDate;
  TimeOfDay? fromTime;
  TimeOfDay? toTime;
  double taxiFare = 0.0;
  double entertainmentCost = 0.0;
  String? purpose;
//ProjectCategories _projectCategories=ProjectCategories.project1;
  ProjectCategoryDropdownItem? _projectCategory;
  TravelTypeDropdownItem? _travelType;

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
                        Row(
                          children: [
                            Expanded(
                              child: DateField(
                                label: "From Date",
                                value: fromDate,
                                onChanged: (val) => setState(() => fromDate = val),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: DateField(
                                label: "To Date",
                                value: toDate,
                                onChanged: (val) => setState(() => toDate = val),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: TimeField(
                                label: "Time From",
                                value: fromTime,
                                onChanged: (val) => setState(() => fromTime = val),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TimeField(
                                label: "Time To",
                                value: toTime,
                                onChanged: (val) => setState(() => toTime = val),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        GenericDropdown<ProjectCategoryDropdownItem>(
                          items: ProjectCategory.values
                              .map((e) => ProjectCategoryDropdownItem(e))
                              .toList(),
                          selectedItem: _projectCategory,
                          onChanged: (val) => setState(() => _projectCategory = val),
                          hint: "Select Project Category",
                        ),

                        GenericDropdown<TravelTypeDropdownItem>(
                          items: TravelTypes.values
                              .map((e) => TravelTypeDropdownItem(e))
                              .toList(),
                          selectedItem: _travelType,
                          onChanged: (val) => setState(() => _travelType = val),
                          hint: "Select Travel Type",
                        ),
                        const SizedBox(height: 12),
                        const SizedBox(height: 12),
                        NumberField(
                          label: "Taxi Fare",
                          value: taxiFare,
                          onChanged: (val) => setState(() => taxiFare = val),
                        ),
                        const SizedBox(height: 12),
                        NumberField(
                          label: "Client Entertainment",
                          value: entertainmentCost,
                          onChanged: (val) => setState(() => entertainmentCost = val),
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                            label: "Purpose", value: purpose, onChanged: (val) => setState(() => purpose = val)),
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
                              'Submit',
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

void _submit() {
  print('Submit button pressed!');
}

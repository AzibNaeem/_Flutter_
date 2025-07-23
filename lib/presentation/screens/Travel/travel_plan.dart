import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/theme_service.dart';
import '../../../data/models/travel_request.dart';
import '../../../domain/enums/project_categories.dart';
import '../../../domain/enums/travel_type.dart';
import '../../../domain/providers/user_provider.dart';
import '../../theme/app_theme.dart';
import '../../view_model/travel_view_model/travel_view_model.dart';
import '../../widgets/dropdown/drop_down.dart';
import '../../widgets/dropdown/project_category_dropdown.dart';
import '../../widgets/dropdown/travel_type_dropdown.dart';
import '../../widgets/travel_widgets/date_fiield.dart';
import '../../widgets/travel_widgets/number_field.dart';
import '../../widgets/travel_widgets/text_field.dart';
import '../../widgets/travel_widgets/time_field.dart';

class TravelFormScreen extends StatefulWidget {
  const TravelFormScreen({Key? key}) : super(key: key);

  @override
  _TravelFormScreenState createState() => _TravelFormScreenState();
}

class _TravelFormScreenState extends State<TravelFormScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? fromDate;
  DateTime? toDate;
  TimeOfDay? fromTime;
  TimeOfDay? toTime;
  double taxiFare = 0.0;
  double entertainmentCost = 0.0;
  String? purpose;
  ProjectCategoryDropdownItem? _projectCategory;
  TravelTypeDropdownItem? _travelType;

  late final List<ProjectCategoryDropdownItem> _projectCategoryItems;
  late final List<TravelTypeDropdownItem> _travelTypeItems;
  String _formatTime(TimeOfDay? time) {
    if (time == null) return '';
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:00";
  }

  void _submit() async {
    print("here in api 1");
    if (!_formKey.currentState!.validate()) return;
    print("here in api 2");

    final user = Provider.of<UserProvider>(context, listen: false).user;
    if (user == null) return;
    print("here in api 3");

    final travel = TravelRequest(
      fromDate: fromDate?.toIso8601String() ?? '',
      toDate: toDate?.toIso8601String() ?? '',
      fromTime: _formatTime(fromTime),
      toTime: _formatTime(toTime),
      projectCategory: _projectCategory?.value.toString().split('.').last ?? '',
      travelType: _travelType?.value.toString().split('.').last ?? '',

      taxiFare: taxiFare,
      entertainmentCost: entertainmentCost,
      purpose: purpose ?? '',
      employeeId: user.employeeId.toString(),
    );

    try {
      await Provider.of<TravelViewModel>(context, listen: false).submitTravelPlan(travel);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Travel Plan Submitted')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed: ${e.toString()}')),
      );
    }
  }
  @override
  void initState() {
    super.initState();
    _projectCategoryItems = ProjectCategory.values
        .map((e) => ProjectCategoryDropdownItem(e))
        .toList();
    _travelTypeItems = TravelTypes.values
        .map((e) => TravelTypeDropdownItem(e))
        .toList();
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
          'Travel Plan',
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
                        DateField(
                            label: "From (Date)", value: fromDate, onChanged: (val) => setState(() => fromDate = val)),
                        const SizedBox(height: 12),
                        DateField(
                            label: "To (Date)", value: toDate, onChanged: (val) => setState(() => toDate = val)),
                        const SizedBox(height: 12),
                        TimeField(
                            label: "Time From", value: fromTime, onChanged: (val) => setState(() => fromTime = val)),
                        const SizedBox(height: 12),
                        TimeField(
                            label: "Time To", value: toTime, onChanged: (val) => setState(() => toTime = val)),
                        const SizedBox(height: 12),
                        GenericDropdown<ProjectCategoryDropdownItem>(
                          items: _projectCategoryItems,
                          selectedItem: _projectCategory,
                          onChanged: (val) => setState(() => _projectCategory = val),
                          hint: "Select Project Category",
                        ),
                        GenericDropdown<TravelTypeDropdownItem>(
                          items: _travelTypeItems,
                          selectedItem: _travelType,
                          onChanged: (val) => setState(() => _travelType = val),
                          hint: "Select Travel Type",
                        ),
                        const SizedBox(height: 12),
                        const SizedBox(height: 12),
                        NumberField(
                          label: "Taxi Fare",
                          value: taxiFare,
                          onChanged: (val) => setState(() => taxiFare = val as double),
                        ),
                        const SizedBox(height: 12),
                        NumberField(
                          label: "Client Entertainment",
                          value: entertainmentCost,
                          onChanged: (val) => setState(() => entertainmentCost = val as double),
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
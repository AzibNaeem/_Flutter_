import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../data/models/travel_request.dart';
import '../../../data/models/travel_type.dart';
import '../../../domain/enums/project_categories.dart';
import '../../../domain/providers/user_provider.dart';
import '../../theme/app_theme.dart';
import '../../view_model/travel_view_model/travel_view_model.dart';

class TravelFormScreen extends StatefulWidget {
  const TravelFormScreen({super.key});

  @override
  State<TravelFormScreen> createState() => _TravelFormScreenState();
}

class _TravelFormScreenState extends State<TravelFormScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? fromDate;
  DateTime? toDate;
  TimeOfDay? fromTime;
  TimeOfDay? toTime;
  String? purpose;
  double taxiFare = 0.0;
  double entertainmentCost = 0.0;
  ProjectCategory? projectCategory;
  TravelType? travelType;

  Future<void> _selectDate(bool isFrom) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() => isFrom ? fromDate = picked : toDate = picked);
    }
  }

  Future<void> _selectTime(bool isFrom) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => isFrom ? fromTime = picked : toTime = picked);
    }
  }

  Future<void> _submit() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    if (_formKey.currentState!.validate() &&
        fromDate != null &&
        toDate != null &&
        fromTime != null &&
        toTime != null &&
        projectCategory != null &&
        travelType != null) {
      final model = TravelRequestModel(
        employeeId: userProvider.user?.employeeId ?? '',
        employeeName: userProvider.user?.name ?? '',
        fromDate: fromDate!.toIso8601String().split('T').first,
        toDate: toDate!.toIso8601String().split('T').first,
        fromTime: fromTime!.format(context),
        toTime: toTime!.format(context),
        taxiFare: taxiFare,
        entertainmentCost: entertainmentCost,
        purpose: purpose!,
        projectCategory: projectCategory!.name,
        travelType: travelType!.name,
      );

      final success = await Provider.of<TravelRequestViewModel>(context, listen: false).submitTravel(model);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Travel request submitted successfully'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
          ),
        );

        // Navigate back to Dashboard after short delay
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // This will pop back to previous screen (Dashboard)
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Submission failed. Try again.'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('⚠️ Please fill all required fields.'),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primary);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('Travel Request', style: TextStyle(color: AppColors.primary)),
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Travel Dates Card
              Card(
                color: AppColors.white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Travel Dates', style: textStyle),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _selectDate(true),
                              child: Card(
                                color: AppColors.white,
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    fromDate == null
                                        ? 'Select Start Date'
                                        : 'Start: ${DateFormat('yyyy-MM-dd').format(fromDate!)}',
                                    style: TextStyle(
                                      color: fromDate == null ? AppColors.primary : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _selectDate(false),
                              child: Card(
                                color: AppColors.white,
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    toDate == null
                                        ? 'Select End Date'
                                        : 'End: ${DateFormat('yyyy-MM-dd').format(toDate!)}',
                                    style: TextStyle(
                                      color: toDate == null ? AppColors.primary : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Travel Time Card
              Card(
                color: AppColors.white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Travel Time', style: textStyle),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _selectTime(true),
                              child: Card(
                                color: AppColors.white,
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    fromTime == null
                                        ? 'Select Start Time'
                                        : 'Start: ${fromTime!.format(context)}',
                                    style: textStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _selectTime(false),
                              child: Card(
                                color: AppColors.white,
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    toTime == null
                                        ? 'Select End Time'
                                        : 'End: ${toTime!.format(context)}',
                                    style: textStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Purpose
              Card(
                color: AppColors.white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Purpose',
                      labelStyle: TextStyle(color: AppColors.primary),
                    ),
                    style: TextStyle(color: AppColors.primary),
                    validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                    onChanged: (val) => purpose = val,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Taxi Fare & Entertainment
              Card(
                color: AppColors.white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Taxi Fare',
                          labelStyle: TextStyle(color: AppColors.primary),
                        ),
                        style: TextStyle(color: AppColors.primary),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => taxiFare = double.tryParse(val) ?? 0.0,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Entertainment Cost',
                          labelStyle: TextStyle(color: AppColors.primary),
                        ),
                        style: TextStyle(color: AppColors.primary),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => entertainmentCost = double.tryParse(val) ?? 0.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Project Category
              Card(
                color: AppColors.white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: DropdownButtonFormField<ProjectCategory>(
                    value: projectCategory,
                    dropdownColor: AppColors.white,
                    decoration: InputDecoration(
                      labelText: 'Project Category',
                      labelStyle: TextStyle(color: AppColors.primary),
                    ),
                    style: TextStyle(color: AppColors.primary),
                    items: ProjectCategory.values
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name, style: TextStyle(color: AppColors.primary)),
                    ))
                        .toList(),
                    onChanged: (val) => setState(() => projectCategory = val),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Travel Type
              Card(
                color: AppColors.white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: DropdownButtonFormField<TravelType>(
                    value: travelType,
                    dropdownColor: AppColors.white,
                    decoration: InputDecoration(
                      labelText: 'Travel Type',
                      labelStyle: TextStyle(color: AppColors.primary),
                    ),
                    style: TextStyle(color: AppColors.primary),
                    items: TravelType.values
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name, style: TextStyle(color: AppColors.primary)),
                    ))
                        .toList(),
                    onChanged: (val) => setState(() => travelType = val),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Submit
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: const Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

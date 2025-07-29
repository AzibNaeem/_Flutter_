import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/experience_data.dart';
import '../../../domain/providers/user_provider.dart';
import '../../../core/themes/theme_service.dart';
import '../../../domain/services/experience/experience_service.dart';
import '../../theme/app_theme.dart';
import '../../widgets/shimmer/experience_shimmer.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  ExperienceData? experienceData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchExperience();
  }

  Future<void> fetchExperience() async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    if (user == null) return;

    try {
      final data = await EmployeeExperienceService().fetchExperience(user.employeeId.trim());
      setState(() {
        experienceData = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppColors.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 1,
        title: Text(
          'Experience',
          style: ThemeService.appBar.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: AppColors.black,
      ),
        body: isLoading
            ? const ExperienceShimmer()
            : experienceData == null
          ? const Center(child: Text("No experience data found"))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCard(
              title: "Total Experience",
              content:
              "${experienceData!.totalExperience.years} years, ${experienceData!.totalExperience.months} months, ${experienceData!.totalExperience.days} days",
            ),
            const SizedBox(height: 12),
            _buildCard(
              title: "Current @ ${experienceData!.currentCompany.name}",
              content:
              "Role: ${experienceData!.currentCompany.role}\nJoined: ${experienceData!.currentCompany.joinedDate}\nDuration: ${experienceData!.currentCompany.duration.years} years, ${experienceData!.currentCompany.duration.months} months, ${experienceData!.currentCompany.duration.days} days",
            ),
            const SizedBox(height: 12),
            _buildCard(
              title: "Previous Company",
              content:
              "Company: ${experienceData!.previousCompany.name}\nRole: ${experienceData!.previousCompany.role}\nDuration: ${experienceData!.previousCompany.duration}",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required String content}) {
    return Card(
      color: AppColors.white,
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: ThemeService.titleMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: ThemeService.bodyMedium.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}

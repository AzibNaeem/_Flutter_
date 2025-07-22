import 'package:flutter/material.dart';
import 'package:hris_project/core/themes/theme_service.dart';
import 'package:hris_project/core/themes/app_theme.dart';

import '../../../core/themes/theme_service.dart';
import '../../theme/app_theme.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors.init(context); // ⚠️ Make sure to call this early

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Experience',
          style: ThemeService.appBar.copyWith(color: AppColors.black),
        ),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ExperienceCard(
              title: 'Software Engineer',
              company: 'ABC Tech',
              duration: 'Jan 2022 - Present',
            ),
            SizedBox(height: 12),
            ExperienceCard(
              title: 'Frontend Developer',
              company: 'XYZ Solutions',
              duration: 'Jun 2020 - Dec 2021',
            ),
            SizedBox(height: 12),
            ExperienceCard(
              title: 'Mobile Developer Intern',
              company: 'MobileX',
              duration: 'Jan 2020 - May 2020',
            ),
            SizedBox(height: 12),
            ExperienceCard(
              title: 'Freelancer',
              company: 'Self-employed',
              duration: '2018 - 2020',
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;
  final String company;
  final String duration;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.company,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: ThemeService.titleMedium.copyWith(color: AppColors.black)),
            const SizedBox(height: 4),
            Text(company, style: ThemeService.bodyMedium.copyWith(color: AppColors.black)),
            const SizedBox(height: 4),
            Text(duration, style: ThemeService.bodySmall.copyWith(color: AppColors.black)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hris_project/core/themes/theme_service.dart';
import '../../theme/app_theme.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors.init(context);
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final isTablet = screenSize.width > 600;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Experience',
          style: ThemeService.appBar.copyWith(
            color: AppColors.black,
            fontSize: isTablet ? 24.0 : 20.0,
          ),
        ),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.black,
        elevation: 0.5,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Layout constraints available for responsive design
          
          // Determine layout based on screen size and orientation
          final crossAxisCount = isTablet && isLandscape ? 2 : 1;
          final padding = isTablet ? 24.0 : 16.0;
          final spacing = isTablet ? 16.0 : 12.0;
          
          final experiences = [
            {
              'title': 'Software Engineer',
              'company': 'ABC Tech',
              'duration': 'Jan 2022 - Present',
            },
            {
              'title': 'Frontend Developer',
              'company': 'XYZ Solutions',
              'duration': 'Jun 2020 - Dec 2021',
            },
            {
              'title': 'Mobile Developer Intern',
              'company': 'MobileX',
              'duration': 'Jan 2020 - May 2020',
            },
            {
              'title': 'Freelancer',
              'company': 'Self-employed',
              'duration': '2018 - 2020',
            },
          ];

          if (crossAxisCount == 2) {
            // Grid layout for tablets in landscape
            return Padding(
              padding: EdgeInsets.all(padding),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: 2.5,
                ),
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  final experience = experiences[index];
                  return ExperienceCard(
                    title: experience['title']!,
                    company: experience['company']!,
                    duration: experience['duration']!,
                    isTablet: isTablet,
                  );
                },
              ),
            );
          } else {
            // List layout for phones and tablets in portrait
            return SingleChildScrollView(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: experiences.map((experience) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: spacing),
                    child: ExperienceCard(
                      title: experience['title']!,
                      company: experience['company']!,
                      duration: experience['duration']!,
                      isTablet: isTablet,
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;
  final String company;
  final String duration;
  final bool isTablet;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.company,
    required this.duration,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    final cardPadding = isTablet ? 20.0 : 16.0;
    final borderRadius = isTablet ? 16.0 : 12.0;
    final titleFontSize = isTablet ? 18.0 : 16.0;
    final bodyFontSize = isTablet ? 16.0 : 14.0;
    final smallFontSize = isTablet ? 14.0 : 12.0;
    final spacing = isTablet ? 6.0 : 4.0;
    
    return Card(
      elevation: isTablet ? 4 : 3,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: ThemeService.titleMedium.copyWith(
                color: AppColors.black,
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: spacing),
            Text(
              company,
              style: ThemeService.bodyMedium.copyWith(
                color: AppColors.black,
                fontSize: bodyFontSize,
              ),
            ),
            SizedBox(height: spacing),
            Text(
              duration,
              style: ThemeService.bodySmall.copyWith(
                color: AppColors.black,
                fontSize: smallFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../domain/services/schedule_block_service.dart';
import '../theme/app_theme.dart';
import '../../core/themes/theme_service.dart';

class ScheduleSection extends StatelessWidget {
  final bool isTablet;
  const ScheduleSection({super.key, this.isTablet = false});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Today's Meetings",
            style: ThemeService.titleMedium.copyWith(
              fontSize: isTablet ? 22 : 16,
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(height: isTablet ? 24 : 12),
        SizedBox(
          height: isTablet ? 100 : 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 16),
            children: const [
              ScheduleBlock(time: '8:00 AM', active: true),
              ScheduleBlock(time: '9:00 AM'),
              ScheduleBlock(time: '9:35 AM'),
              ScheduleBlock(time: '3:00 PM', active: true),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../presentation/theme/app_theme.dart';
import '../../core/themes/theme_service.dart';

class ScheduleBlock extends StatelessWidget {
  final String time;
  final bool active;

  const ScheduleBlock({required this.time, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: active ? AppColors.scheduleActive : AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      alignment: Alignment.center,
      child: Text(
        time,
        style: ThemeService.bodyMedium.copyWith(
          color: active ? AppColors.white : AppColors.lightText,
          fontWeight: ThemeService.fontWeightBold,
        ),
      ),
    );
  }
}

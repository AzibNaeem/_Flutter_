import 'package:flutter/material.dart';
import '../../domain/services/dashboard_cards/dashboard_card_data_service.dart';
import '../../domain/services/futuristic_card/futuristic_card_service.dart';
import '../../data/models/login_user.dart';
import '../theme/app_theme.dart';

class DashboardGrid extends StatelessWidget {
  final LoginUser user;
  final bool isTablet;

  const DashboardGrid({super.key, required this.user, this.isTablet = false});

  @override
  Widget build(BuildContext context) {
    final cards = [
      DashboardCardData(
        title: 'Leave & Attendance',
        value: '',
        icon: Icons.calendar_today,
        color: AppColors.primaryLight,
        route: '/attendance-leaves',
        textColor: AppColors.lightText,
      ),
      DashboardCardData(
        title: 'Employee Report',
        value: '',
        icon: Icons.bar_chart,
        color: AppColors.primaryLight,
        route: '/report',
        textColor: AppColors.lightText,
      ),
      DashboardCardData(
        title: 'Salary Management',
        value: '',
        icon: Icons.attach_money,
        color: AppColors.primaryLight,
        route: '/payslip',
        textColor: AppColors.lightText,
      ),
      DashboardCardData(
        title: 'Onboarding & Training',
        value: '',
        icon: Icons.school,
        color: AppColors.primaryLight,
        route: '/onboarding',
        textColor: AppColors.lightText,
      ),
    ];

    final crossAxisCount = 2;
    final aspectRatio = 1.0;
    final cardIconSize = isTablet ? 40.0 : 32.0;
    final cardTitleFontSize = isTablet ? 16.0 : 14.0;
    final cardValueFontSize = isTablet ? 20.0 : 16.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 0 : 0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cards.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: isTablet ? 24 : 12,
          mainAxisSpacing: isTablet ? 24 : 12,
          childAspectRatio: aspectRatio,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, cards[index].route, arguments: user);
          },
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: cards[index].color,
            child: FuturisticCard(card: cards[index]),
          ),
        ),
      ),
    );
  }
}

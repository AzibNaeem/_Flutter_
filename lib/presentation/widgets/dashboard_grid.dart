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
        title: 'Rewards & Recognition',
        value: '',
        icon: Icons.emoji_events,
        color: AppColors.primaryLight,
        route: '/rewards',
        textColor: AppColors.lightText,
      ),
      DashboardCardData(
        title: 'Experience',
        value: '',
        icon: Icons.work,
        color: AppColors.primaryLight,
        route: '/experience',
        textColor: AppColors.lightText,
      ),
      DashboardCardData(
        title: 'Teams',
        value: '',
        icon: Icons.school,
        color: AppColors.primaryLight,
        route: '/my-teams',
        textColor: AppColors.lightText,
      ),
    ];

    final crossAxisCount = 2;
    final aspectRatio = 1.0;

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

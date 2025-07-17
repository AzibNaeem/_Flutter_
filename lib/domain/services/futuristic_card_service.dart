import 'package:flutter/material.dart';
import 'dashboard_card_data_service.dart';
import '../../core/themes/theme_service.dart';

class FuturisticCard extends StatelessWidget {
  final DashboardCardData card;

  const FuturisticCard({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(card.icon, size: 26, color: card.textColor),
              const SizedBox(height: 16),
              Text(
                card.title,
                style: ThemeService.cardTitle.copyWith(
                  fontSize: ThemeService.fontSizeBodySmall,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(card.value, style: ThemeService.cardValue),
            ],
          ),
          if (card.badge != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  card.badge!,
                  style: ThemeService.bodySmall.copyWith(
                    fontWeight: ThemeService.fontWeightBold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

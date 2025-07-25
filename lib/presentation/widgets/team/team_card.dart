import 'package:flutter/material.dart';
import '../../../data/models/team_allocation.dart';
import '../../theme/app_theme.dart';

class TeamCard extends StatelessWidget {
  final String title;
  final TeamMember member;
  final textColor;

  const TeamCard({super.key, required this.title, required this.member, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: title.isNotEmpty ? Text(title) : null,
      title: Text(member.name),
      subtitle: Text(member.employeeId),
      textColor: AppColors.primary,
    );
  }
}
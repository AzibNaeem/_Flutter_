import 'package:flutter/material.dart';
import '../../../data/models/team_allocation.dart';

class TeamCard extends StatelessWidget {
  final String title;
  final TeamMember member;

  const TeamCard({super.key, required this.title, required this.member});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: title.isNotEmpty ? Text(title) : null,
      title: Text(member.name),
      subtitle: Text(member.employeeId),
    );
  }
}
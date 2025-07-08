import 'package:flutter/material.dart';
import 'package:hris_project/presentation/theme/app_theme.dart';
class UserAccountInfo extends StatelessWidget {
  final String name;
  final String role;
  final String? avatarUrl;

  const UserAccountInfo({
    super.key,
    required this.name,
    required this.role,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            avatarUrl ?? 'https://via.placeholder.com/150',
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
              ),
            ),
            Text(
              role,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/user_account_info.dart';
import '../widgets/work_buttons.dart';
import '../../data/models/login_user.dart';
import '../theme/app_theme.dart';

class ProfileCard extends StatelessWidget {
  final LoginUser user;
  final bool isWorking;
  final VoidCallback onStartWork;
  final VoidCallback onEndWork;

  const ProfileCard({
    super.key,
    required this.user,
    required this.isWorking,
    required this.onStartWork,
    required this.onEndWork,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return Card(
      elevation: 4,
      color: AppColors.primaryLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: UserAccountInfo(name: user.name, role: user.role),
            ),
            SizedBox(height: isTablet ? 32 : 20),
            Center(
              child: WorkButtons(
                buttons: [
                  ButtonData(
                    label: 'Start Work',
                    color: isWorking ? AppColors.white : AppColors.background,
                    textColor: AppColors.primary,
                    onPressed: isWorking ? () {} : onStartWork,
                  ),
                  ButtonData(
                    label: 'End Work',
                    color: isWorking ? AppColors.background : AppColors.white,
                    textColor: AppColors.primary,
                    onPressed: !isWorking ? () {} : onEndWork,
                    outlined: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

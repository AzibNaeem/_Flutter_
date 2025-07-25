import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/user_provider.dart';
import '../../theme/app_theme.dart';
import '../../view_model/rewards_view_model/rewards_view_model.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  final List<Color> rewardColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.brown,
    Colors.pink,
    Colors.amber,
    Colors.indigo,
  ];

  Color getColorForReward(String rewardName) {
    final index = rewardName.hashCode % rewardColors.length;
    return rewardColors[index];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final rewardViewModel = Provider.of<RewardViewModel>(context, listen: false);
      final employeeId = userProvider.user?.employeeId.toString();

      if (employeeId != null) {
        rewardViewModel.loadReward(employeeId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final rewardViewModel = Provider.of<RewardViewModel>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final employeeId = userProvider.user?.employeeId.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Employee Rewards",
          style: TextStyle(color: AppColors.primary, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.background,
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      backgroundColor: AppColors.white,
      body: employeeId == null
          ? Center(
        child: Text(
          "No employee logged in",
          style: TextStyle(color: AppColors.primary, fontSize: 20),
        ),
      )
          : rewardViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : rewardViewModel.error != null
          ? Center(
        child: Text(
          'Error: ${rewardViewModel.error}',
          style: TextStyle(color: AppColors.primary, fontSize: 20),
        ),
      )
          : rewardViewModel.reward == null
          ? Center(
        child: Text(
          "No rewards found",
          style: TextStyle(color: AppColors.primary, fontSize: 20),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Employee ID: ${rewardViewModel.reward!.employeeId}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22, // Increased from 19
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                ...rewardViewModel.reward!.rewards.entries.map((entry) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${entry.key}: ${entry.value}",
                        style: TextStyle(
                          color: getColorForReward(entry.key),
                          fontSize: 20, // Increased from 17
                        ),
                      ),
                      const Divider(thickness: 1, height: 16),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

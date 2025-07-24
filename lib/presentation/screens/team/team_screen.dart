import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../view_model/all_teams_view_model/all_teams_vm.dart';
import '../../widgets/shimmer/teams_shimmer.dart';
import '../../widgets/team/team_card.dart';
import '../../../domain/providers/user_provider.dart';

class MyTeamsScreen extends StatefulWidget {
  const MyTeamsScreen({super.key});

  @override
  State<MyTeamsScreen> createState() => _MyTeamsScreenState();
}

class _MyTeamsScreenState extends State<MyTeamsScreen> {
  @override
  void initState() {
    super.initState();

    // Safe loading after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = Provider.of<UserProvider>(context, listen: false).user;
      if (user != null) {
        context.read<AllTeamsViewModel>().loadTeamsForUser(user.employeeId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AllTeamsViewModel>();

    if (vm.isLoading) {
      return ListView.builder(
        itemCount: 3,
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, __) => const TeamCardShimmer(),
      );
    }

    if (vm.error != null) return Center(child: Text("Error: ${vm.error}"));

    final teams = vm.teams;

    if (teams.isEmpty) return const Center(child: Text("No teams found."));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text("My Teams", style: TextStyle(color: AppColors.primary)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: teams.entries.map((entry) {
          final project = entry.key;
          final team = entry.value;
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(project, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  if (team.reportingManager != null)
                    TeamCard(title: "Reporting Manager", member: team.reportingManager!),
                  if (team.teamLead != null)
                    TeamCard(title: "Team Lead", member: team.teamLead!),
                  const SizedBox(height: 8),
                  Text("Employees", style: Theme.of(context).textTheme.titleMedium),
                  ...team.employees.map((e) => TeamCard(title: "", member: e)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
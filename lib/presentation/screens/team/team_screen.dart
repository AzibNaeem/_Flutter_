import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../view_model/all_teams_view_model/all_teams_vm.dart';
import '../../widgets/shimmer/teams_shimmer.dart';
import '../../widgets/team/team_card.dart';
import '../../../domain/providers/user_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MyTeamsScreen extends StatefulWidget {
  const MyTeamsScreen({super.key});

  @override
  State<MyTeamsScreen> createState() => _MyTeamsScreenState();
}

class _MyTeamsScreenState extends State<MyTeamsScreen> {
  String? selectedProject;
  bool showEmployees = true;

  @override
  void initState() {
    super.initState();
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
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text("My Teams", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 3,
          padding: const EdgeInsets.all(16),
          itemBuilder: (_, __) => const TeamCardShimmer(),
        ),
      );
    }

    if (vm.error != null) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Text("My Teams", style: TextStyle(color: AppColors.primary)),
          centerTitle: true,
        ),
        body: Center(child: Text("Error: ${vm.error}", style: TextStyle(color: AppColors.primary))),
      );
    }

    final teams = vm.teams;
    final projectNames = teams.keys.toList();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text("My Teams", style: TextStyle(color: AppColors.primary)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField2<String>(
              isExpanded: true,
              value: selectedProject,
              onChanged: (value) {
                setState(() {
                  selectedProject = value;
                });
              },
              items: projectNames.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: TextStyle(color: AppColors.primary)),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: "Select Project",
                labelStyle: TextStyle(color: AppColors.primary),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(Icons.arrow_drop_down, color: AppColors.primary),
                iconSize: 24,
                openMenuIcon: Icon(Icons.arrow_drop_up, color: AppColors.primary),
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primary),
                ),
                elevation: 4,
                maxHeight: 300,
              ),
              buttonStyleData: const ButtonStyleData(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            const SizedBox(height: 12),
            if (selectedProject != null)
              Theme(
                data: Theme.of(context).copyWith(
                  checkboxTheme: CheckboxThemeData(
                    fillColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                    checkColor: MaterialStateProperty.all(AppColors.primary),
                    side: BorderSide(color: AppColors.primary),
                  ),
                ),
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Show Team Members", style: TextStyle(color: AppColors.primary)),
                  value: showEmployees,
                  onChanged: (val) => setState(() => showEmployees = val ?? true),
                  controlAffinity: ListTileControlAffinity.leading,
                  tileColor: Colors.transparent,
                ),
              ),
            const SizedBox(height: 12),
            if (selectedProject != null)
              Card(
                elevation: 6,
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          selectedProject!,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(thickness: 1, color: Colors.grey, height: 10),


                      // Reporting Manager
                      if (teams[selectedProject]?.reportingManager?.name.trim().isNotEmpty ?? false) ...[
                        Center(child: Text("Reporting Manager", style: TextStyle(fontSize: 16, color: AppColors.primary, fontWeight: FontWeight.bold))),
                        const SizedBox(height: 4),
                        TeamCard(
                          title: "",
                          member: teams[selectedProject]!.reportingManager!,
                          textColor: Colors.black,
                        ),
                      ],

                      const Divider(thickness: 1, color: Colors.grey, height: 10),

                      // Team Lead
                      if (teams[selectedProject]?.teamLead?.name.trim().isNotEmpty ?? false) ...[
                        Center(child: Text("Team Lead", style: TextStyle(fontSize: 16, color: AppColors.primary, fontWeight: FontWeight.bold))),
                        const SizedBox(height: 4),
                        TeamCard(
                          title: "",
                          member: teams[selectedProject]!.teamLead!,
                          textColor: Colors.black,
                        ),
                      ],

                      if (showEmployees)...[
                        const Divider(thickness: 1, color: Colors.grey, height: 10),
                        Center(child: Text("Team Members", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primary))),
                        const SizedBox(height: 4),
                        ...teams[selectedProject]!.employees.map(
                              (e) => TeamCard(
                            title: "",
                            member: e,
                            textColor: AppColors.black,
                          ),
                        ),
                      ],
                          ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

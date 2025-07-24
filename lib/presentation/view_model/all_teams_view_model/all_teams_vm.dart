import 'package:flutter/material.dart';
import '../../../data/models/team_allocation.dart';
import '../../../domain/services/department_allocation/department_allocation_service.dart';
import '../../../domain/services/team_allocation/team_allocation_service.dart';

class AllTeamsViewModel extends ChangeNotifier {
  final DepartmentAllocationService _deptService = DepartmentAllocationService();
  final TeamService _teamService = TeamService();

  final Map<String, ProjectTeam> _teams = {};
  bool isLoading = false;
  String? error;

  Map<String, ProjectTeam> get teams => _teams;

  Future<void> loadTeamsForUser(String employeeId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final allocations = await _deptService.getAllocationsForUser(employeeId);
      final projects = allocations.map((e) => e.project).toSet();

      for (final project in projects) {
        final team = await _teamService.fetchTeamForProject(project);
        _teams[project] = team;
      }
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}

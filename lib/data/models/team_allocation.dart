class TeamMember {
  final String employeeId;
  final String name;

  TeamMember({required this.employeeId, required this.name});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      employeeId: json['employee_id'],
      name: json['name'],
    );
  }
}

class ProjectTeam {
  final TeamMember? reportingManager;
  final TeamMember? teamLead;
  final List<TeamMember> employees;

  ProjectTeam({
    required this.reportingManager,
    required this.teamLead,
    required this.employees,
  });

  factory ProjectTeam.fromJson(Map<String, dynamic> json) {
    return ProjectTeam(
      reportingManager: json['reporting_manager'] != null
          ? TeamMember.fromJson(json['reporting_manager'])
          : null,
      teamLead: json['team_lead'] != null
          ? TeamMember.fromJson(json['team_lead'])
          : null,
      employees: (json['employees'] as List)
          .map((e) => TeamMember.fromJson(e))
          .toList(),
    );
  }
}
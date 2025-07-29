class HierarchyModel {
  final String? reportingManager;
  final String? hrbp;
  final String? teamLead;
  final String? projectManager;

  HierarchyModel({
    this.reportingManager,
    this.hrbp,
    this.teamLead,
    this.projectManager,
  });

  factory HierarchyModel.fromJson(Map<String, dynamic> json) {
    return HierarchyModel(
      reportingManager: json['reporting_manager'],
      hrbp: json['hrbp'],
      teamLead: json['team_lead'],
      projectManager: json['project_manager'],
    );
  }
}

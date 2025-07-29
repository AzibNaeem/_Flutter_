class ExperienceData {
  final String employeeId;
  final TotalExperience totalExperience;
  final CurrentCompany currentCompany;
  final PreviousCompany previousCompany;

  ExperienceData({
    required this.employeeId,
    required this.totalExperience,
    required this.currentCompany,
    required this.previousCompany,
  });

  factory ExperienceData.fromJson(Map<String, dynamic> json) {
    return ExperienceData(
      employeeId: json['employeeId'],
      totalExperience: TotalExperience.fromJson(json['totalExperience']),
      currentCompany: CurrentCompany.fromJson(json['currentCompany']),
      previousCompany: PreviousCompany.fromJson(json['previousCompany']),
    );
  }
}

class TotalExperience {
  final int years;
  final int months;
  final int days;

  TotalExperience({
    required this.years,
    required this.months,
    required this.days,
  });

  factory TotalExperience.fromJson(Map<String, dynamic> json) {
    return TotalExperience(
      years: json['years'],
      months: json['months'],
      days: json['days'],
    );
  }
}

class CurrentCompany {
  final String name;
  final String joinedDate;
  final CompanyDuration duration;
  final String role;

  CurrentCompany({
    required this.name,
    required this.joinedDate,
    required this.duration,
    required this.role,
  });

  factory CurrentCompany.fromJson(Map<String, dynamic> json) {
    return CurrentCompany(
      name: json['name'],
      joinedDate: json['joinedDate'],
      duration: CompanyDuration.fromJson(json['duration']),
      role: json['role'],
    );
  }
}

class CompanyDuration {
  final int years;
  final int months;
  final int days;

  CompanyDuration({
    required this.years,
    required this.months,
    required this.days,
  });

  factory CompanyDuration.fromJson(Map<String, dynamic> json) {
    return CompanyDuration(
      years: json['years'],
      months: json['months'],
      days: json['days'],
    );
  }
}

class PreviousCompany {
  final String name;
  final String duration;
  final String role;

  PreviousCompany({
    required this.name,
    required this.duration,
    required this.role,
  });

  factory PreviousCompany.fromJson(Map<String, dynamic> json) {
    return PreviousCompany(
      name: json['name'],
      duration: json['duration'],
      role: json['role'],
    );
  }
}

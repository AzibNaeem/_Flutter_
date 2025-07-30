class TravelRequestModel {
  final String employeeId;
  final String employeeName;
  final String fromDate;
  final String toDate;
  final String fromTime;
  final String toTime;
  final double taxiFare;
  final double entertainmentCost;
  final String purpose;
  final String projectCategory;
  final String travelType;

  TravelRequestModel({
    required this.employeeId,
    required this.employeeName,
    required this.fromDate,
    required this.toDate,
    required this.fromTime,
    required this.toTime,
    required this.taxiFare,
    required this.entertainmentCost,
    required this.purpose,
    required this.projectCategory,
    required this.travelType,
  });

  Map<String, dynamic> toJson() => {
    "employee_id": employeeId,
    "employee_name": employeeName,
    "from_date": fromDate,
    "to_date": toDate,
    "from_time": fromTime,
    "to_time": toTime,
    "taxi_fare": taxiFare,
    "entertainment_cost": entertainmentCost,
    "purpose": purpose,
    "project_category": projectCategory,
    "travel_type": travelType,
  };
}

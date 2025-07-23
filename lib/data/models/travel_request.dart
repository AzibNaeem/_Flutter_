// data/models/travel_request.dart
class TravelRequest {
  final String fromDate;
  final String toDate;
  final String fromTime;
  final String toTime;
  final String projectCategory;
  final String travelType;
  final double taxiFare;
  final double entertainmentCost;
  final String purpose;
  final String employeeId;

  TravelRequest({
    required this.fromDate,
    required this.toDate,
    required this.fromTime,
    required this.toTime,
    required this.projectCategory,
    required this.travelType,
    required this.taxiFare,
    required this.entertainmentCost,
    required this.purpose,
    required this.employeeId,
  });

  Map<String, dynamic> toJson() => {
    "from_date": fromDate,
    "to_date": toDate,
    "from_time": fromTime,
    "to_time": toTime,
    "project_category": projectCategory,
    "travel_type": travelType,
    "taxi_fare": taxiFare,
    "entertainment_cost": entertainmentCost,
    "purpose": purpose,
    "employee_id": employeeId,
  };
}

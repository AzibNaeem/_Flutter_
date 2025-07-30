class WeeklyMenu {
  final String day;
  final String option1;
  final String option2;
  final String option3;
  final String dinner;

  WeeklyMenu({
    required this.day,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.dinner,
  });

  factory WeeklyMenu.fromJson(Map<String, dynamic> json) {
    return WeeklyMenu(
      day: json['day'] ?? '',
      option1: json['option1'] ?? '',
      option2: json['option2'] ?? '',
      option3: json['option3'] ?? '',
      dinner: json['dinner'] ?? '',
    );
  }
}

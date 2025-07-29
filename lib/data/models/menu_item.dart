class MenuModel {
  final String day;
  final String option1;
  final String option2;
  final String option3;
  final String dinner;
  final int dayId;

  MenuModel({
    required this.day,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.dinner,
    required this.dayId,
  });


  List<String> get items => [option1, option2, option3, dinner];

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      day: json['day'],
      option1: json['option1'],
      option2: json['option2'],
      option3: json['option3'],
      dinner: json['dinner'],
      dayId: json['dayId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'dinner': dinner,
      'dayId': dayId,
    };
  }
}

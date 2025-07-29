class FeedbackAnswer {
  final String section;
  final List<String> selectedOptions;

  FeedbackAnswer({
    required this.section,
    required this.selectedOptions,
  });

  factory FeedbackAnswer.fromJson(Map<String, dynamic> json) {
    return FeedbackAnswer(
      section: json['section'],
      selectedOptions: List<String>.from(json['selected_options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'section': section,
      'selected_options': selectedOptions,
    };
  }
}

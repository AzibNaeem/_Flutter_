class FeedbackFormSection {
  final String title;
  final List<String> questions;

  FeedbackFormSection({
    required this.title,
    required this.questions,
  });

  factory FeedbackFormSection.fromJson(Map<String, dynamic> json) {
    return FeedbackFormSection(
      title: json['title'],
      questions: List<String>.from(json['questions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'questions': questions,
    };
  }
}

import 'feedback_answer.dart';

class SubmittedFeedback {
  final String employeeId;
  final String employeeName;
  final String submittedOn;
  final List<FeedbackAnswer> feedback;

  SubmittedFeedback({
    required this.employeeId,
    required this.employeeName,
    required this.submittedOn,
    required this.feedback,
  });

  factory SubmittedFeedback.fromJson(Map<String, dynamic> json) {
    return SubmittedFeedback(
      employeeId: json['employee_id'],
      employeeName: json['employee_name'],
      submittedOn: json['submitted_on'],
      feedback: (json['feedback'] as List)
          .map((e) => FeedbackAnswer.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employee_id': employeeId,
      'employee_name': employeeName,
      'submitted_on': submittedOn,
      'feedback': feedback.map((e) => e.toJson()).toList(),
    };
  }
}

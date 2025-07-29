import 'package:flutter/material.dart';
import '../../../data/models/feedback/feedback_answer.dart';
import '../../../data/models/feedback/feedback_question_model.dart';
import '../../../data/models/feedback/feedback_submission_model.dart';
import '../../../domain/services/feedback/feedback_service.dart';

class FeedbackViewModel extends ChangeNotifier {
  final FeedbackService _feedbackService = FeedbackService();

  List<FeedbackFormSection> formSections = [];
  List<SubmittedFeedback> previousFeedbacks = [];
  Map<String, Set<String>> selectedAnswers = {};
  bool isLoading = false;

  Future<void> loadFeedbackForm() async {
    try {
      isLoading = true;
      notifyListeners();
      formSections = await _feedbackService.fetchFeedbackForm();
    } catch (e) {
      print("Error loading form: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadPreviousFeedbacks(String employeeId) async {
    try {
      isLoading = true;
      notifyListeners();
      previousFeedbacks = await _feedbackService.fetchPreviousFeedbacks(employeeId);
    } catch (e) {
      print('Error loading previous feedbacks: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void toggleCheckbox(String section, String option) {
    if (!selectedAnswers.containsKey(section)) {
      selectedAnswers[section] = {};
    }
    if (selectedAnswers[section]!.contains(option)) {
      selectedAnswers[section]!.remove(option);
    } else {
      selectedAnswers[section]!.add(option);
    }
    notifyListeners();
  }

  bool isChecked(String section, String option) {
    return selectedAnswers[section]?.contains(option) ?? false;
  }

  Future<bool> submitFeedback(String employeeId, String employeeName) async {
    final now = DateTime.now().toIso8601String();
    final feedbackList = selectedAnswers.entries.map((entry) {
      return FeedbackAnswer(section: entry.key, selectedOptions: entry.value.toList());
    }).toList();

    final feedback = SubmittedFeedback(
      employeeId: employeeId,
      employeeName: employeeName,
      submittedOn: now,
      feedback: feedbackList,
    );

    final success = await _feedbackService.submitFeedback(feedback);
    if (success) {
      selectedAnswers.clear();
      await loadPreviousFeedbacks(employeeId);
    }
    return success;
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/API/api_constants_late_sitting.dart';
import '../../../data/models/feedback/feedback_question_model.dart';
import '../../../data/models/feedback/feedback_submission_model.dart';

class FeedbackService {
  Future<List<FeedbackFormSection>> fetchFeedbackForm() async {
    final url = Uri.parse('${APIConstantsLateSitting.baseURL}/feedback/form');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List sectionsJson = data['sections'];
      return sectionsJson.map((e) => FeedbackFormSection.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load feedback form');
    }
  }

  Future<List<SubmittedFeedback>> fetchPreviousFeedbacks(String employeeId) async {
    final url = Uri.parse('${APIConstantsLateSitting.baseURL}/feedback/$employeeId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List list = json.decode(response.body);
      return list.map((e) => SubmittedFeedback.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load previous feedbacks');
    }
  }

  Future<bool> submitFeedback(SubmittedFeedback feedback) async {
    final url = Uri.parse('${APIConstantsLateSitting.baseURL}/feedback');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(feedback.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> submitFeedbackRaw(Map<String, dynamic> body) async {
    final url = Uri.parse('https://merry-in-martin.ngrok-free.app/feedback');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return response.statusCode == 200;
  }

}

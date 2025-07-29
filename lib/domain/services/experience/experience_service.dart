import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/API/api_constants_experience.dart';
import '../../../data/models/experience_data.dart';

class EmployeeExperienceService {
  Future<ExperienceData?> fetchExperience(String employeeId) async {
    final url = Uri.parse('${ApiConstantsExperience.baseUrl}/experience/$employeeId');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return ExperienceData.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}

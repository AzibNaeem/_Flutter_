// ✅ team_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/API/api_constants_team.dart';
import '../../../data/models/team_allocation.dart';


class TeamService {
  Future<ProjectTeam> fetchTeamForProject(String projectName) async {
    final url = Uri.parse('${TeamApiConstants.baseUrl}/team/$projectName');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return ProjectTeam.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Team not found for project: $projectName");
    }
  }
}
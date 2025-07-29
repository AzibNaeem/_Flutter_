
import 'package:flutter/material.dart';
import 'package:hris_project/domain/services/Travel/travel_service.dart';
import '../../../data/models/travel_request.dart';


class TravelViewModel with ChangeNotifier {
  final TravelPlanService _apiService = TravelPlanService();

  Future<void> submitTravelPlan(TravelRequest travel) async {
    await _apiService.submitTravelPlan(travel);
  }
}

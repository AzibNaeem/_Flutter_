import 'package:flutter/material.dart';
import '../../../data/models/travel_request.dart';
import '../../../domain/services/Travel/travel_service.dart';

class TravelRequestViewModel extends ChangeNotifier {
  final TravelRequestService _service = TravelRequestService();

  Future<bool> submitTravel(TravelRequestModel model) async {
    return await _service.submitTravelRequest(model);
  }
}

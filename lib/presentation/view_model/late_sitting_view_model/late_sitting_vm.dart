import 'package:flutter/material.dart';
import '../../../data/models/late_sitting_model.dart';
import '../../../domain/services/late_sitting/late_sitting_service.dart';

class LateSittingViewModel extends ChangeNotifier {
  final service = LateSittingService();
  bool isLoading = false;
  String? error;
  List<LateSittingRequest> requests = [];

  Future<void> fetch(String empId) async {
    isLoading = true; error = null; notifyListeners();
    try {
      requests = await service.getRequests(empId);
    } catch (e) { error = e.toString(); }
    isLoading = false; notifyListeners();
  }

  Future<void> submit(String empId, LateSittingRequest req) async {
    isLoading = true; error = null; notifyListeners();
    try {
      await service.postRequest(empId, req);
      await fetch(empId);
    } catch (e) { error = e.toString(); }
    isLoading = false; notifyListeners();
  }
}

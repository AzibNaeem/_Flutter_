import 'package:flutter/material.dart';
import '../../../data/models/employee_rewards.dart';
import '../../../domain/services/rewards/employee_rewards.dart';

class RewardViewModel extends ChangeNotifier {
  Reward? _reward;
  bool _isLoading = false;
  String? _error;

  Reward? get reward => _reward;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadReward(String employeeId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _reward = await RewardService.fetchRewardByEmployeeId(employeeId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

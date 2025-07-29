import 'package:flutter/foundation.dart';

import '../../../data/models/hierarchy_model.dart';
import '../../../domain/repositories/resource_hierarchy/hierarchy_repository.dart';

class HierarchyViewModel with ChangeNotifier {
  final HierarchyRepository _repository;

  HierarchyModel? _hierarchy;
  bool _isLoading = false;

  HierarchyViewModel(this._repository);

  HierarchyModel? get hierarchy => _hierarchy;
  bool get isLoading => _isLoading;

  Future<void> loadHierarchy(String userId) async {
    _isLoading = true;
    notifyListeners();

    _hierarchy = await _repository.fetchUserHierarchy(userId);

    _isLoading = false;
    notifyListeners();
  }
}

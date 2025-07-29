import '../../../data/models/hierarchy_model.dart';

abstract class HierarchyRepository {
  Future<HierarchyModel?> fetchUserHierarchy(String userId);
}

import '../../../data/models/hierarchy_model.dart';
import '../../services/resource_hierarchy/resource_hierarchy_service.dart';
import 'hierarchy_repository.dart';

class HierarchyRepositoryImpl implements HierarchyRepository {
  final ResourceHierarchyService resourceHierarchyService;

  HierarchyRepositoryImpl(this.resourceHierarchyService);

  @override
  Future<HierarchyModel?> fetchUserHierarchy(String userId) {
    return resourceHierarchyService.getUserHierarchy(userId);
  }
}

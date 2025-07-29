import '../../../data/models/hierarchy_model.dart';

class ResourceHierarchyService {
  Future<HierarchyModel?> getUserHierarchy(String userId) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate loading

    return HierarchyModel(
      reportingManager: "Ali Raza",
      hrbp: "Fatima Noor",
      teamLead: "Zain Ahmed",
      projectManager: "Sara Khan",
    );
  }
}

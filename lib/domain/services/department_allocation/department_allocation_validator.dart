import '../../../data/models/department_allocation.dart';

class DepartmentAllocationValidator {
  List<DepartmentAllocationItem> validAllocations(
    List<DepartmentAllocationItem> allocations,
  ) {
    double total = 0;
    final List<DepartmentAllocationItem> valid = [];
    for (final alloc in allocations) {
      if (total + alloc.allocation > 1.0) break;
      valid.add(alloc);
      total += alloc.allocation;
    }
    return valid;
  }
}

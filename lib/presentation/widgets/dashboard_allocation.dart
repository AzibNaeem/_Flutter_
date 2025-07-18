import 'package:flutter/material.dart';
import '../../data/models/department_allocation.dart';
import '../../core/themes/theme_service.dart';
import '../theme/app_theme.dart';

class DashboardAllocation extends StatelessWidget {
  final List<DepartmentAllocationItem> allocations;
  const DashboardAllocation({super.key, required this.allocations});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return Card(
      color: AppColors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 24 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Department Allocation",
              style: ThemeService.titleMedium.copyWith(
                fontSize: isTablet ? 22 : 16,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: isTablet ? 24 : 12),
            ..._buildAllocationBars(allocations, isTablet),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAllocationBars(
    List<DepartmentAllocationItem> items,
    bool isTablet,
  ) {
    final colors = [
      Colors.blueAccent,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.redAccent,
      Colors.teal,
    ];
    return List.generate(items.length, (i) {
      final alloc = items[i];
      final color = colors[i % colors.length];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: isTablet ? 38 : 26,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 1.2),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: alloc.allocation,
                    child: Container(
                      height: isTablet ? 38 : 26,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1.2),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            alloc.project.isNotEmpty
                                ? '${alloc.project} - ${alloc.department}'
                                : alloc.department,
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: isTablet ? 15 : 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            '${(alloc.allocation * 100).toStringAsFixed(0)}%',
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: isTablet ? 16 : 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

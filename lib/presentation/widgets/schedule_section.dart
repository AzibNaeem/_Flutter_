import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../../core/themes/theme_service.dart';

class DepartmentAllocation {
  final String department;
  final String project;
  final double percentage;
  final Color color;
  DepartmentAllocation({
    required this.department,
    required this.project,
    required this.percentage,
    required this.color,
  });
}

class ScheduleSection extends StatelessWidget {
  final bool isTablet;
  const ScheduleSection({super.key, this.isTablet = false});

  // Mock data for demonstration
  List<DepartmentAllocation> get allocations => [
    DepartmentAllocation(
      department: 'Engineering',
      project: 'HRIS App',
      percentage: 0.7,
      color: Colors.blueAccent,
    ),
    DepartmentAllocation(
      department: 'HR',
      project: 'Recruitment Portal',
      percentage: 0.2,
      color: Colors.green,
    ),
    DepartmentAllocation(
      department: 'Marketing',
      project: 'Brand Revamp',
      percentage: 0.1,
      color: Colors.orange,
    ),
  ];

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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Department Allocation",
                style: ThemeService.titleMedium.copyWith(
                  fontSize: isTablet ? 22 : 16,
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: isTablet ? 24 : 12),
            ...allocations.map(
              (alloc) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          // Shadow for elevation effect
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: alloc.color,
                                    blurRadius: 8,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: isTablet ? 38 : 26,
                            decoration: BoxDecoration(
                              color: alloc.color,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.2,
                              ),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: alloc.percentage,
                            child: Container(
                              height: isTablet ? 38 : 26,
                              decoration: BoxDecoration(
                                color: alloc.color,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.2,
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                  ),
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                  ),
                                  child: Text(
                                    '${(alloc.percentage * 100).toStringAsFixed(0)}%',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../../core/themes/theme_service.dart';

class DepartmentAllocation {
  final String department;
  final double percentage;
  final Color color;

  DepartmentAllocation({
    required this.department,
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
      department: 'HRIS Module - Mobile Development',
      percentage: 0.7,
      color: AppColors.background,
    ),
    DepartmentAllocation(
      department: 'HR',
      percentage: 0.2,
      color: AppColors.background,
    ),
    DepartmentAllocation(
      department: 'Marketing',
      percentage: 0.1,
      color: AppColors.background,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    return Card(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Department Allocation",
                  style: ThemeService.titleMedium.copyWith(
                    fontSize: isTablet ? 22 : 20,
                    color: AppColors.primary,
                  ),
                ),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Stack(
                        children: [
                          // Background container with border
                          Container(
                            height: isTablet ? 32 : 40,
                            decoration: BoxDecoration(
                              color: alloc.color.withOpacity(0.15),
                              border: Border.all(
                                color: AppColors.primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          // Filled portion showing percentage
                          FractionallySizedBox(
                            widthFactor: alloc.percentage,
                            child: Container(
                              height: isTablet ? 32 : 40,
                              decoration: BoxDecoration(
                                color: alloc.color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          // Text content overlaid
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      alloc.department,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isTablet ? 16 : 15,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${(alloc.percentage * 100).toStringAsFixed(0)}%',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: isTablet ? 16 : 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

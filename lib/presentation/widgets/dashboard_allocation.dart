import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../core/themes/theme_service.dart';
import '../../data/models/department_allocation.dart';
import '../theme/app_theme.dart';

class DashboardAllocation extends StatelessWidget {
  final List<DepartmentAllocationItem> allocations;
  const DashboardAllocation({super.key, required this.allocations});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    final List<Color> colors = [
      Colors.yellow,
      Colors.blueAccent,
      Colors.red,
      Colors.purple,
      Colors.redAccent,
      Colors.teal,
    ];

    return Card(
      color: AppColors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 24 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Department Allocation",
                style: ThemeService.titleMedium.copyWith(
                  fontSize: isTablet ? 22 : 20,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: isTablet ? 24 : 12),

            // Pie Chart
            SizedBox(
              height: isTablet ? 220 : 160,
              child: PieChart(
                PieChartData(
                  sections: allocations.asMap().entries.map((entry) {
                    final i = entry.key;
                    final alloc = entry.value;
                    return PieChartSectionData(
                      color: colors[i % colors.length],
                      value: alloc.allocation * 100,
                      title: '',
                      radius: 70,
                    );
                  }).toList(),
                  sectionsSpace: 2,
                  centerSpaceRadius: 0,
                ),
              ),
            ),

            SizedBox(height: isTablet ? 24 : 12),

            // Legend List
            ...allocations.asMap().entries.map((entry) {
              final i = entry.key;
              final alloc = entry.value;
              final color = colors[i % colors.length];
              final label = alloc.project.isNotEmpty
                  ? '${alloc.project} - ${alloc.department}'
                  : alloc.department;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black12),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        label,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${(alloc.allocation * 100).toStringAsFixed(0)}%',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

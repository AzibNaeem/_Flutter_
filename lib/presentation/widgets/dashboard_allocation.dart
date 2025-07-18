import 'package:flutter/material.dart';
import '../../data/models/department_allocation.dart';
import '../../core/themes/theme_service.dart';
import '../theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardAllocation extends StatelessWidget {
  final List<DepartmentAllocationItem> allocations;
  const DashboardAllocation({super.key, required this.allocations});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    final colors = [
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
            SizedBox(
              height: isTablet ? 220 : 160,
              child: PieChart(
                PieChartData(
                  sections: List.generate(allocations.length, (i) {
                    final alloc = allocations[i];
                    final color = colors[i % colors.length];
                    return PieChartSectionData(
                      color: color,
                      value: alloc.allocation * 100,
                      title: '',
                      radius: isTablet ? 70 : 70,
                    );
                  }),
                  sectionsSpace: 2,
                  centerSpaceRadius: 0,
                ),
              ),
            ),
            SizedBox(height: isTablet ? 24 : 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(allocations.length, (i) {
                final alloc = allocations[i];
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
                            border: Border.all(color: Colors.black12, width: 1),
                          ),
                        ),
                        // for text
                        SizedBox(width: 6),
                        Text(
                          label,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: isTablet ? 15 : 15,
                            fontWeight: FontWeight.bold ,
                          ),
                        ),
                        // for the percentages
                        SizedBox(width: 6),
                        Text(
                          '${(alloc.allocation * 100).toStringAsFixed(0)}%',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: isTablet ? 14 : 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

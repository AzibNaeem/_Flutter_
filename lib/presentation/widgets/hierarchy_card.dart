import 'package:flutter/material.dart';
import '../../data/models/hierarchy_model.dart';
import '../theme/app_theme.dart';

class HierarchyCard extends StatelessWidget {
  final HierarchyModel hierarchy;

  const HierarchyCard({super.key, required this.hierarchy});

  @override
  Widget build(BuildContext context) {
    AppColors.init(context); // Initialize brightness context

    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.white, // Use dynamic background
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Resource Hierarchy",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.scheduleActive, // A prominent highlight color
              ),
            ),
            const SizedBox(height: 12),
            _buildRow("Reporting Manager", hierarchy.reportingManager),
            _buildRow("HRBP", hierarchy.hrbp),
            _buildRow("Team Lead", hierarchy.teamLead),
            _buildRow("Project Manager", hierarchy.projectManager),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.black,
            ),
          ),
          Text(
            value ?? "Not Assigned",
            style: TextStyle(
              fontSize: 14,
              color: value != null
                  ? AppColors.black
                  : AppColors.lightText.withOpacity(0.6),
              fontStyle: value != null ? FontStyle.normal : FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

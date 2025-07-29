import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class LeaveItemData {
  final String date;
  final String reason;

  const LeaveItemData({required this.date, required this.reason});
}

class LeavesCard extends StatelessWidget {
  final List<LeaveItemData> leaves;
  const LeavesCard({Key? key, required this.leaves}) : super(key: key);

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green.shade600;
      case 'pending':
        return Colors.orange.shade700;
      case 'rejected':
        return Colors.red.shade600;
      default:
        return AppColors.lightText;
    }
  }

  String _statusText(String reason) {
    final match = RegExp(r'\(([^)]+)\)').firstMatch(reason);
    return match != null ? match.group(1)! : '';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.beach_access, color: AppColors.black, size: 28),
                const SizedBox(width: 10),
                Text(
                  'Leaves',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (leaves.isEmpty)
              Center(
                child: Text(
                  'No leaves found.',
                  style: TextStyle(color: AppColors.black),
                ),
              )
            else
              ...leaves.map((leave) {
                final status = _statusText(leave.reason);
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primaryLight,
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.event_note, color: AppColors.black),
                    title: Text(
                      leave.date,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      leave.reason.replaceAll(RegExp(r'\s*\([^)]*\)'), ''),
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                    trailing: status.isNotEmpty
                        ? Chip(
                            label: Text(
                              status,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: _statusColor(status),
                          )
                        : null,
                  ),
                );
              }).toList(),
          ],
        ),
      ),
    );
  }
}

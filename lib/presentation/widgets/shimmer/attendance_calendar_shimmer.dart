import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AttendanceCalendarShimmer extends StatelessWidget {
  const AttendanceCalendarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // fixed height to avoid pixel issues
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(6, (index) => _shimmerCell(context)),
        ),
      ),
    );
  }

  Widget _shimmerCell(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 16, width: 60, color: Colors.white),
            const SizedBox(height: 10),
            Container(height: 24, width: 80, color: Colors.white),
            const SizedBox(height: 10),
            Container(height: 16, width: 50, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

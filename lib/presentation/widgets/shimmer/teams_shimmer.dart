import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TeamCardShimmer extends StatelessWidget {
  const TeamCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 20, width: 150, color: Colors.white),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(height: 16, width: 100, color: Colors.white),
                  const SizedBox(width: 12),
                  Container(height: 16, width: 120, color: Colors.white),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(height: 16, width: 80, color: Colors.white),
                  const SizedBox(width: 8),
                  Container(height: 16, width: 150, color: Colors.white),
                ],
              ),
              const SizedBox(height: 12),
              ...List.generate(3, (index) => Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Container(height: 14, width: 80, color: Colors.white),
                    const SizedBox(width: 8),
                    Container(height: 14, width: 140, color: Colors.white),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
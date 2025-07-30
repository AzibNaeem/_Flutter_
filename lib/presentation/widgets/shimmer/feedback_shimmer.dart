import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeedbackShimmer extends StatelessWidget {
  const FeedbackShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3, // Number of fake cards
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 16, width: 150, color: Colors.white),
                  const SizedBox(height: 12),
                  Container(height: 14, width: double.infinity, color: Colors.white),
                  const SizedBox(height: 8),
                  Container(height: 14, width: double.infinity, color: Colors.white),
                  const SizedBox(height: 8),
                  Container(height: 14, width: MediaQuery.of(context).size.width * 0.6, color: Colors.white),
                  const SizedBox(height: 16),
                  Row(
                    children: List.generate(
                      5,
                          (_) => Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

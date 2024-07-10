import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridItemShimmer extends StatelessWidget {
  const GridItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height:
                    120, // Adjust height according to your grid item aspect ratio
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  2,
                  (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 2.0),
                        child: Container(
                          height: 10,
                          width: index == 0
                              ? 100
                              : 60, // Different widths for a more natural look
                          color: Colors.grey[300],
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

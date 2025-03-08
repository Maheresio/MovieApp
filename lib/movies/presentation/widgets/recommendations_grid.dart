import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:second_project/core/constants/app_strings.dart';
import 'package:second_project/movies/domain/entities/recommendation.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationsGrid extends StatelessWidget {
  final List<Recommendation> recommendations;

  const RecommendationsGrid({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        final recommendation = recommendations[index];
        return FadeInUp(
          from: 20,
          duration: const Duration(milliseconds: 500),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            child: CachedNetworkImage(
              imageUrl:
                  "${AppStrings.baseImageUrl}${recommendation.backdropPath}",
              placeholder:
                  (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 170.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 180.0,
              fit: BoxFit.cover,
            ),
          ),
        );
      }, childCount: recommendations.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_strings.dart';

class SeeMoreMovieImage extends StatelessWidget {
  const SeeMoreMovieImage({super.key, required this.backdropPath});
  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: CachedNetworkImage(
        height: 21.h,
        fit: BoxFit.cover,
        imageUrl: "${AppStrings.baseImageUrl}$backdropPath",
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[850]!,
          highlightColor: Colors.grey[800]!,
          child: Container(
            height: 21.h,
            width: 120.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}


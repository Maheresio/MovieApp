import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../domain/entities/movies.dart';
import '../screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class PopularMovieItem extends StatelessWidget {
  final Movies movie;

  const PopularMovieItem({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return MovieDetailScreen(id: movie.id, movies: movie);
          }));
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            width: 120.0,
            fit: BoxFit.cover,
            imageUrl: "${AppStrings.baseImageUrl}${movie.backdropPath}",
            placeholder: (context, url) => Shimmer.fromColors(
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
          ),
        ),
      ),
    );
  }
}

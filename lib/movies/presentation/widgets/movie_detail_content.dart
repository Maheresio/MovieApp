import 'package:flutter/material.dart';
import 'package:second_project/movies/domain/entities/movies.dart';
import 'package:second_project/movies/domain/entities/recommendation.dart';
import 'package:second_project/movies/presentation/widgets/movie_detail_appbar.dart';
import 'package:second_project/movies/presentation/widgets/movie_detail_info.dart';
import 'package:second_project/movies/presentation/widgets/movie_details_recommendations.dart';
import 'package:second_project/movies/presentation/widgets/recommendations_grid.dart';

class MovieDetailContent extends StatelessWidget {
  final Movies movie;
  final List<Recommendation> recommendations;

  const MovieDetailContent({
    super.key,
   required this.movie,
    required this.recommendations,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('movieDetailScrollView'),
      slivers: [
        MovieDetailAppBar(movie: movie),
        MovieDetailInfo(movie: movie),
        MovieDetailRecommendations(recommendations: recommendations),
        RecommendationsGrid(recommendations: recommendations),
      ],
    );
  }
}

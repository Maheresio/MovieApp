import 'package:flutter/material.dart';
import 'package:second_project/core/constants/app_strings.dart';
import 'package:second_project/movies/domain/entities/movies.dart';
import 'package:second_project/movies/presentation/screens/movie_detail_screen.dart';
import 'package:second_project/movies/presentation/widgets/movie_backdrop_image.dart';
import 'package:second_project/movies/presentation/widgets/movie_info.dart';

class MovieCarouselItem extends StatelessWidget {
  final Movies movie;

  const MovieCarouselItem({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('openMovieMinimalDetail'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return MovieDetailScreen(id: movie.id, movies: movie);
            },
          ),
        );
      },
      child: Stack(
        children: [
          MovieBackdropImage(
            imageUrl: "${AppStrings.baseImageUrl}${movie.backdropPath}",
          ),
          MovieInfo(title: movie.title),
        ],
      ),
    );
  }
}


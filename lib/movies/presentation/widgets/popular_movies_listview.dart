import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:second_project/movies/domain/entities/movies.dart';
import 'package:second_project/movies/presentation/widgets/popular_movie_item.dart';

class PopularMoviesListView extends StatelessWidget {
  final List<Movies> movies;

  const PopularMoviesListView({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return PopularMovieItem(movie: movies[index]);
          },
        ),
      ),
    );
  }
}


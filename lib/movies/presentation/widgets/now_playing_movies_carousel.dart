import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:second_project/movies/domain/entities/movies.dart';
import 'package:second_project/movies/presentation/widgets/movie_carousel_item.dart';

class NowPlayingMoviesCarousel extends StatelessWidget {
  final List<Movies> movies;

  const NowPlayingMoviesCarousel({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: CarouselSlider(
        options: CarouselOptions(height: 400.0, viewportFraction: 1.0),
        items: movies.map((item) => MovieCarouselItem(movie: item)).toList(),
      ),
    );
  }
}


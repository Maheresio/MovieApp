import 'genres.dart';

class MoviesDetails {
  final int id;
  final String? backdropPath;
  final List<Genres> generes;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  MoviesDetails({
    required this.id,
    this.backdropPath,
    required this.generes,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });
}

import '../../domain/entities/movies_details.dart';
import 'genres_model.dart';

class MoviesDetailsModel extends MoviesDetails {
  MoviesDetailsModel({
    required super.id,
    super.backdropPath,
    required super.generes,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });
  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
        id: json['id'],
        backdropPath:
            json['backdrop_path'] ?? "/2k9tBql5GYH328Krj66tDT9LtFZ.jpg",
        generes: List.from(json['genres'].map((x) => GenresModel.fromJson(x))),
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'],
      );
}

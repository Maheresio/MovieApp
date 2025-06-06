import 'dart:core';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movies_details.dart';
import '../../../domain/entities/recommendation.dart';

class MoviesDetailsState {
  final MoviesDetails? moviesDetails;
  final RequestState requestMoviesDetails;
  final String messageMoviesDetails;
  final List<Recommendation> recommendationMovies;
  final RequestState requestRecommendationMovies;
  final String messageRecommendationMovies;
  MoviesDetailsState({
    this.moviesDetails,
    this.requestMoviesDetails = RequestState.loading,
    this.messageMoviesDetails = "",
    this.recommendationMovies = const [],
    this.requestRecommendationMovies = RequestState.loading,
    this.messageRecommendationMovies = "",
  });
  MoviesDetailsState copyWith({
    MoviesDetails? moviesDetails,
    RequestState? requestMoviesDetails,
    String? messageMoviesDetails,
    List<Recommendation>? recommendationMovies,
    RequestState? requestRecommendationMovies,
    String? messageRecommendationMovies,
  }) {
    return MoviesDetailsState(
      moviesDetails: moviesDetails ?? this.moviesDetails,
      requestMoviesDetails: requestMoviesDetails ?? this.requestMoviesDetails,
      messageMoviesDetails: messageMoviesDetails ?? this.messageMoviesDetails,
      recommendationMovies: recommendationMovies ?? this.recommendationMovies,
      requestRecommendationMovies:
          requestRecommendationMovies ?? this.requestRecommendationMovies,
      messageRecommendationMovies:
          messageRecommendationMovies ?? this.messageRecommendationMovies,
    );
  }
}

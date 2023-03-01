import 'package:dartz/dartz.dart';
import '../entities/movies.dart';
import '../entities/movies_details.dart';
import '../entities/recommendation.dart';

import '../../../core/error/faillure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlaying();
  Future<Either<Failure, List<Movies>>> getPopularMovies();
  Future<Either<Failure, List<Movies>>> getTopRatedMovies();
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(int id);
  Future<Either<Failure, List<Recommendation>>> getMoviesRecommendations(
      int id);
}

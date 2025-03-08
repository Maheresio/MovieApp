import 'package:dartz/dartz.dart';

import '../../../core/error/faillure.dart';
import '../entities/recommendation.dart';
import '../repository/base_movies_repository.dart';

class GetMoviesRecommendationUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetMoviesRecommendationUseCase({
    required this.baseMoviesRepository,
  });
  Future<Either<Failure, List<Recommendation>>> execute(int id) async {
    return await baseMoviesRepository.getMoviesRecommendations(id);
  }
}

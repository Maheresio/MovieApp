import 'package:dartz/dartz.dart';

import '../../../core/error/faillure.dart';
import '../entities/movies.dart';
import '../repository/base_movies_repository.dart';

class GetNowPlayingUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingUseCase({
    required this.baseMoviesRepository,
  });
  Future<Either<Failure, List<Movies>>> execute() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}

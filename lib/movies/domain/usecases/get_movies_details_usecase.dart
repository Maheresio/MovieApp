import 'package:dartz/dartz.dart';

import '../../../core/error/faillure.dart';
import '../entities/movies_details.dart';
import '../repository/base_movies_repository.dart';

class GetMoviesDetailsUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetMoviesDetailsUseCase({
    required this.baseMoviesRepository,
  });
  Future<Either<Failure, MoviesDetails>> execute(int id) async {
    return await baseMoviesRepository.getMoviesDetails(id);
  }
}

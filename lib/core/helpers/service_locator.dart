import 'package:get_it/get_it.dart';
import 'package:second_project/movies/data/data_source/movies_remote_data_source.dart';
import 'package:second_project/movies/data/repository/movies_repository.dart';
import 'package:second_project/movies/domain/repository/base_movies_repository.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MoviesRemoteDataSource());
  getIt.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(
    baseMoviesRemoteDataSource: getIt<BaseMoviesRemoteDataSource>(),
  ));
}
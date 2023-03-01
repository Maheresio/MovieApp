import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_movies_details_usecase.dart';
import '../../../domain/usecases/get_movies_recommendation_usecase.dart';
import 'movies_details_event.dart';
import 'movies_details_state.dart';

import '../../../../core/utils/enums.dart';
import '../../../data/data_source/movies_remote_data_source.dart';
import '../../../data/repository/movies_repository.dart';
import '../../../domain/repository/base_movies_repository.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetMoviesRecommendationUseCase getMoviesRecommendationUseCase;
  MoviesDetailsBloc(
      this.getMoviesDetailsUseCase, this.getMoviesRecommendationUseCase)
      : super(MoviesDetailsState()) {
    BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
        MoviesRemoteDataSource();
    BaseMoviesRepository baseMoviesRepository = MoviesRepository(
        baseMoviesRemoteDataSource: baseMoviesRemoteDataSource);
    /////////////////Movie Details
    on<GetMoviesDetailsEvent>((event, emit) async {
      final result = await GetMoviesDetailsUseCase(
              baseMoviesRepository: baseMoviesRepository)
          .execute(event.id);

      result.fold((l) {
        emit(state.copyWith(
          requestMoviesDetails: RequestState.error,
          messageMoviesDetails: l.message,
        ));
      },
          (r) => {
                emit(state.copyWith(
                  requestMoviesDetails: RequestState.loaded,
                  moviesDetails: r,
                )),
              });
    });

    ///////////////Recommendation Movies
    on<GetMoviesRecommendationEvents>((event, emit) async {
      final result = await GetMoviesRecommendationUseCase(
              baseMoviesRepository: baseMoviesRepository)
          .execute(event.id);

      result.fold((l) {
        emit(state.copyWith(
          requestRecommendationMovies: RequestState.error,
          messageRecommendationMovies: l.message,
        ));
      },
          (r) => {
                emit(state.copyWith(
                  recommendationMovies: r,
                  requestRecommendationMovies: RequestState.loaded,
                )),
              });
    });
  }
}

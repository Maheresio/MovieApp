import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/movies/presentation/widgets/movie_detail_content.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/movies.dart';
import '../controller/movies_bloc/movies_details_event.dart';
import '../controller/movies_bloc/movies_details_state.dart';

import '../../data/data_source/movies_remote_data_source.dart';
import '../../data/repository/movies_repository.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/usecases/get_movies_details_usecase.dart';
import '../../domain/usecases/get_movies_recommendation_usecase.dart';
import '../controller/movies_bloc/movies_details_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;
  final Movies movies;
  const MovieDetailScreen({super.key, required this.id, required this.movies});

  @override
  Widget build(BuildContext context) {
    BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
        MoviesRemoteDataSource();
    BaseMoviesRepository baseMoviesRepository = MoviesRepository(
      baseMoviesRemoteDataSource: baseMoviesRemoteDataSource,
    );
    return BlocProvider(
      create:
          (context) => MoviesDetailsBloc(
            GetMoviesDetailsUseCase(baseMoviesRepository: baseMoviesRepository),
            GetMoviesRecommendationUseCase(
              baseMoviesRepository: baseMoviesRepository,
            ),
          )..add(GetMoviesRecommendationEvents(id: id)),
      lazy: false,
      child: BlocBuilder<MoviesDetailsBloc, MoviesDetailsState>(
        builder: (context, state) {
          switch (state.requestRecommendationMovies) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.loaded:
              return Scaffold(
                body: MovieDetailContent(
                  movie: movies,
                  recommendations: state.recommendationMovies,
                ),
              );
            case RequestState.error:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

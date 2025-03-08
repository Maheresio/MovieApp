import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/movies/presentation/widgets/popular_error_widget.dart';
import 'package:second_project/movies/presentation/widgets/popular_loading_widget.dart';
import 'package:second_project/movies/presentation/widgets/popular_movies_listview.dart';
import '../../../core/utils/enums.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import '../controller/movies_bloc/movies_state.dart';


class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        switch (state.popularPlayingState) {
          case RequestState.loading:
            return const PopularLoadingWidget();
          case RequestState.loaded:
            return PopularMoviesListView(movies: state.popularPlayingMovies);
          case RequestState.error:
            return const PopularErrorWidget();
        }
      },
    );
  }
}


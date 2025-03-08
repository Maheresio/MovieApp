import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/movies/presentation/widgets/top_rating_error_widget.dart';
import 'package:second_project/movies/presentation/widgets/top_rating_movies_listview.dart';
import '../../../core/utils/enums.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import '../controller/movies_bloc/movies_state.dart';


import '../widgets/top_rating_loading_widget.dart';

class TopRatingView extends StatelessWidget {
  const TopRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        switch (state.topRatingPlayingState) {
          case RequestState.loading:
            return const TopRatingLoadingWidget();
          case RequestState.loaded:
            return TopRatingMoviesListView(movies: state.topRatingPlayingMovies);
          case RequestState.error:
            return const TopRatingErrorWidget();
        }
      },
    );
  }
}





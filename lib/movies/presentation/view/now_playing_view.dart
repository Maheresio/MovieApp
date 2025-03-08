import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/now_playing_loading_widget.dart';
import '../widgets/now_playing_movies_carousel.dart';
import '../../../core/utils/enums.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import '../controller/movies_bloc/movies_state.dart';

class NowPlayingView extends StatelessWidget {
  const NowPlayingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return const NowPlayingLoadingWidget();
          case RequestState.loaded:
            return NowPlayingMoviesCarousel(movies: state.nowPlayingMovies);
          case RequestState.error:
            return ErrorWidget(state.nowPlayingMessage);
        }
      },
    );
  }
}

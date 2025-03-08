import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/movies/presentation/widgets/movies_category_section.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import '../controller/movies_bloc/movies_state.dart';
import 'see_more_movies_list_screen.dart';
import '../view/now_playing_view.dart';
import '../view/popular_movies_view.dart';
import '../view/top_rating_view.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NowPlayingView(),
                MoviesCategorySection(
                  title: "Popular",
                  onTap: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return SeeMoreMoviesListScreen(
                            movies: state.popularPlayingMovies,
                            titleAppBar: "Popular Movies",
                          );
                        },
                      ),
                    );
                  },
                ),
                const PopularMoviesView(),
                MoviesCategorySection(
                  title: "Top Rated",
                  onTap: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return SeeMoreMoviesListScreen(
                            movies: state.topRatingPlayingMovies,
                            titleAppBar: "Top Rated Movies",
                          );
                        },
                      ),
                    );
                  },
                ),
                const TopRatingView(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        );
      },
    );
  }
}

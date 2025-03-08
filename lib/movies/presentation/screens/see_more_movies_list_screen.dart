import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entities/movies.dart';
import '../widgets/see_more_movies_item.dart';
import 'movie_detail_screen.dart';

class SeeMoreMoviesListScreen extends StatelessWidget {
  const SeeMoreMoviesListScreen({
    super.key,
    required this.movies,
    required this.titleAppBar,
  });
  final List<Movies> movies;
  final String titleAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titleAppBar)),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(1.5.h),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return MovieDetailScreen(
                          id: movies[index].id,
                          movies: movies[index],
                        );
                      },
                    ),
                  );
                },
                child: SeeMoreMoviesItem(moviesData: movies[index]),
              ),
            );
          },
          itemCount: movies.length,
        ),
      ),
    );
  }
}




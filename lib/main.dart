import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/app_color.dart';
import 'core/helpers/service_locator.dart';
import 'movies/domain/repository/base_movies_repository.dart';
import 'movies/domain/usecases/get_movies_details_usecase.dart';
import 'movies/domain/usecases/get_movies_recommendation_usecase.dart';
import 'movies/domain/usecases/get_now_playing_usecase.dart';
import 'movies/domain/usecases/get_popular_movies_usecase.dart';
import 'movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'movies/presentation/controller/movies_bloc/movies_details_bloc.dart';
import 'movies/presentation/controller/movies_bloc/movies_event.dart';
import 'movies/presentation/screens/splash_screen.dart';

void main() {
  setupServiceLocator();

  runApp(Sizer(builder: (context, orientation, deviceType) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  MoviesBloc(
                      GetNowPlayingUseCase(
                        baseMoviesRepository: getIt<BaseMoviesRepository>(),
                      ),
                      GetPopularMoviesUseCase(
                        baseMoviesRepository: getIt<BaseMoviesRepository>(),
                      ),
                      GetTopRateMoviesUseCase(
                        baseMoviesRepository: getIt<BaseMoviesRepository>(),
                      ),
                    )
                    ..add(GetNowPlayingEvent())
                    ..add(GetPopularMoviesEvent())
                    ..add(GetTopRatedEvent()),
          lazy: false,
        ),
        BlocProvider(
          create:
              (context) => MoviesDetailsBloc(
                GetMoviesDetailsUseCase(
                  baseMoviesRepository: getIt<BaseMoviesRepository>(),
                ),
                GetMoviesRecommendationUseCase(
                  baseMoviesRepository: getIt<BaseMoviesRepository>(),
                ),
              ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: AppColor.kBlack,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

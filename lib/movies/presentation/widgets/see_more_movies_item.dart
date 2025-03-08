import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../domain/entities/movies.dart';
import 'see_more_movie_details.dart';
import 'see_more_movie_image.dart';
import 'package:sizer/sizer.dart';

class SeeMoreMoviesItem extends StatelessWidget {
  const SeeMoreMoviesItem({super.key, required this.moviesData});
  final Movies moviesData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      padding: EdgeInsets.all(1.5.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kBlackGrey,
        borderRadius: BorderRadius.circular(2.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SeeMoreMovieImage(backdropPath: moviesData.backdropPath),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: SeeMoreMovieDetails(moviesData: moviesData),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/core/constants/app_color.dart';
import 'package:second_project/movies/domain/entities/movies.dart';
import 'package:second_project/movies/presentation/widgets/release_date_badge.dart';
import 'package:sizer/sizer.dart';

class SeeMoreMovieDetails extends StatelessWidget {
  const SeeMoreMovieDetails({super.key, required this.moviesData});
  final Movies moviesData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          moviesData.title,
          maxLines: 1,
          style: GoogleFonts.actor(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            ReleaseDateBadge(releaseDate: moviesData.releaseDate),
            SizedBox(width: 3.w),
            Icon(Icons.star, color: AppColor.kYellow, size: 2.5.h),
            SizedBox(width: 1.w),
            Text(
              (moviesData.voteAverage / 2).toStringAsFixed(1),
              style: GoogleFonts.acme(),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Text(
          moviesData.overView,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.actor(fontSize: 12.sp),
        ),
      ],
    );
  }
}


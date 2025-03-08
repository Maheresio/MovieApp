import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_strings.dart';
import '../../domain/entities/movies.dart';

class MovieDetailAppBar extends StatelessWidget {
  final Movies movie;

  const MovieDetailAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        movie.title,
        maxLines: 1,
        style: GoogleFonts.acme(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
      pinned: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0.0, 0.5, 1.0, 1.0],
              ).createShader(Rect.fromLTRB(0.0, 0.0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              imageUrl: "${AppStrings.baseImageUrl}${movie.backdropPath}",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}


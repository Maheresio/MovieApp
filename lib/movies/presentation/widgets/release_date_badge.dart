import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/core/constants/app_color.dart';
import 'package:sizer/sizer.dart';

class ReleaseDateBadge extends StatelessWidget {
  const ReleaseDateBadge({super.key, required this.releaseDate});
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 0.5.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.kRed,
        borderRadius: BorderRadius.circular(1.h),
      ),
      child: Text(
        releaseDate.split('-')[0],
        style: GoogleFonts.acme(),
      ),
    );
  }
}

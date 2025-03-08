import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/core/constants/app_color.dart';

class MoviesCategorySection extends StatelessWidget {
  final String title;
  final void Function(BuildContext context) onTap;

  const MoviesCategorySection({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              color: AppColor.kWhite,
            ),
          ),
          InkWell(
            onTap: () => onTap(context),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('See More', style: TextStyle(color: AppColor.kWhite)),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: AppColor.kWhite,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

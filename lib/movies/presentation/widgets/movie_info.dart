import 'package:flutter/material.dart';
import 'package:second_project/core/constants/app_color.dart';

class MovieInfo extends StatelessWidget {
  final String title;

  const MovieInfo({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.circle, color: Colors.redAccent, size: 16.0),
                const SizedBox(width: 4.0),
                Text(
                  'Now Playing'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: AppColor.kWhite,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, color: AppColor.kWhite),
            ),
          ),
        ],
      ),
    );
  }
}

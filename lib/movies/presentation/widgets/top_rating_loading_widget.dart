
import 'package:flutter/material.dart';

class TopRatingLoadingWidget extends StatelessWidget {
  const TopRatingLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 170,
      child: const CircularProgressIndicator(),
    );
  }
}

import 'package:flutter/material.dart';

class NowPlayingLoadingWidget extends StatelessWidget {
  const NowPlayingLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 400,
      child: const CircularProgressIndicator(),
    );
  }
}

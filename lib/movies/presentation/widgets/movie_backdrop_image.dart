import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieBackdropImage extends StatelessWidget {
  final String imageUrl;

  const MovieBackdropImage({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
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
          stops: [0, 0.3, 0.5, 1],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: CachedNetworkImage(
        height: 560.0,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}


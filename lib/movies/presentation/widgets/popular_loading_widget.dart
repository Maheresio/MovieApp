import 'package:flutter/material.dart';

class PopularLoadingWidget extends StatelessWidget {
  const PopularLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 170,
      child: const CircularProgressIndicator(),
    );
  }
}


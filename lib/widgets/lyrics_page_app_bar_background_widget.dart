import 'package:flutter/material.dart';

class LyricsPageAppBarBackgroundWidget extends StatelessWidget {
  final String imagePath;

  const LyricsPageAppBarBackgroundWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final colorFilter = ColorFilter.mode(
      Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
      BlendMode.dstATop,
    );

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          colorFilter: colorFilter,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

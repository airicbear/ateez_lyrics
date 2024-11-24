import 'package:flutter/material.dart';

class AlbumPageAppBarBackgroundWidget extends StatelessWidget {
  final String albumImagePath;

  const AlbumPageAppBarBackgroundWidget({
    super.key,
    required this.albumImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Hero(
        tag: albumImagePath,
        child: FittedBox(
          fit: BoxFit.contain,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(albumImagePath, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

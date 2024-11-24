import 'package:flutter/material.dart';

class AlbumPageAppBarTitleWidget extends StatelessWidget {
  final String albumTitle;

  const AlbumPageAppBarTitleWidget({super.key, required this.albumTitle});

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            );

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        albumTitle,
        style: textStyle,
      ),
    );
  }
}
